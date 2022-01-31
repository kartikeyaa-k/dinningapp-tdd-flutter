import 'package:bloc/bloc.dart';
import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_drinks.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_meals.dart';
import 'package:equatable/equatable.dart';

part 'restaurent_data_state.dart';

class RestaurentDataCubit
    extends Cubit<RestaurentDataState> {
  final GetRestaurentDrinks _getRestaurentDrinks;
  final GetRestaurentMeals _getRestaurentMeals;

  RestaurentDataCubit(
      {required GetRestaurentDrinks
          getRestaurentDrinks,
      required GetRestaurentMeals
          getRestaurentMeals})
      : _getRestaurentDrinks =
            getRestaurentDrinks,
        _getRestaurentMeals = getRestaurentMeals,
        super(Empty());

  Future<void> getMealsCubit() async {
    emit(Loading());
    final mealEither =
        await _getRestaurentMeals();
    mealEither?.fold((failure) {
      emit(Error(message: failure.toString()));
    }, (data) {
      emit(LoadedMeals(meals: data));
    });
  }

  Future<void> getDrinksCubit() async {
    emit(Loading());
    final drinkEither =
        await _getRestaurentDrinks();
    drinkEither?.fold((failure) {
      emit(Error(message: failure.toString()));
    }, (data) {
      emit(LoadedDrinks(drinks: data));
    });
  }
}
