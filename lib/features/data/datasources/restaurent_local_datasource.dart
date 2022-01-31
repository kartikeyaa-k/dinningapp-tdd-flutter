import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dinner_generator_app/main.dart';
import 'package:hive/hive.dart';

abstract class RestaurentLocalDataSource {
  Future<List<Meal>>? cacheMeals(
      List<Meal> remoteMeals);
  Future<List<Drink>>? cacheDrinks(
      List<Drink> remoteDrinks);
  Future<List<Meal>>? getMeals();
  Future<List<Drink>>? getDrinks();
}

class RestaurentLocalDataSourceImpl
    implements RestaurentLocalDataSource {
  // final HiveInterface hive;
  @override
  Future<List<Drink>> cacheDrinks(
      List<Drink> remoteDrinks) async {
    // await drinkBox?.clear();
    await drinkBox?.addAll(remoteDrinks);
    return remoteDrinks;
  }

  @override
  Future<List<Meal>> cacheMeals(
      List<Meal> remoteMeals) async {
    // await mealBox?.clear();
    await mealBox?.addAll(remoteMeals);
    print(mealBox?.isEmpty);
    print(mealBox?.values.map((e) => e));
    mealBox?.values.forEach((element) {
      print('===> ${element}');
    });
    return remoteMeals;
  }

  @override
  Future<List<Drink>> getDrinks() {
    return Future.value(
        drinkBox?.values.toList() as List<Drink>);
  }

  @override
  Future<List<Meal>> getMeals() {
    final cacheValues = mealBox?.values.toList();
    if (cacheValues == null ||
        cacheValues.isEmpty) {
      return Future.value([]);
    } else {
      return Future.value(
          mealBox?.values.toList() as List<Meal>);
    }
  }
}
