import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:hive/hive.dart';
part 'meal_model.g.dart';

class MealResponseModel {
  List<Meal> meals;

  MealResponseModel({required this.meals});

  factory MealResponseModel.fromJson(
      Map<String, dynamic> json) {
    return MealResponseModel(
        meals: json['meals'] != null
            ? List<MealModel>.from((json['meals']
                    as List<dynamic>)
                .map(
                    (e) => MealModel.fromJson(e)))
            : []);
  }
}

@HiveType(typeId: 0)
class MealModel extends Meal {
  const MealModel({
    @HiveField(0) required String idMeal,
    @HiveField(1) required String strMeal,
    @HiveField(2) required String strCategory,
    @HiveField(3) required String strArea,
    @HiveField(4) required String strInstructions,
    @HiveField(5) required String strMealThumb,
    @HiveField(6) String? strTags,
    @HiveField(7) required String strYoutube,
  }) : super(
            idMeal: idMeal,
            strMeal: strMeal,
            strCategory: strCategory,
            strArea: strArea,
            strInstructions: strInstructions,
            strMealThumb: strMealThumb,
            strTags: strTags,
            strYoutube: strYoutube);

  factory MealModel.fromJson(
      Map<String, dynamic> json) {
    return MealModel(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strCategory: json['strCategory'],
        strArea: json['strArea'],
        strInstructions: json['strInstructions'],
        strMealThumb: json['strMealThumb'],
        strTags: json['strTags'],
        strYoutube: json['strYoutube']);
  }
}
