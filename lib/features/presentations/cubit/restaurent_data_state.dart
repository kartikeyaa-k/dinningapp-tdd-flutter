part of 'restaurent_data_cubit.dart';

abstract class RestaurentDataState extends Equatable {
  const RestaurentDataState();

  @override
  List<Object> get props => [];
}

class Empty extends RestaurentDataState {}

class Loading extends RestaurentDataState {}

class LoadedMeals extends RestaurentDataState {
  final List<Meal> meals;
  const LoadedMeals({required this.meals});
}

class LoadedDrinks extends RestaurentDataState {
  final List<Drink> drinks;
  const LoadedDrinks({required this.drinks});
}

class Error extends RestaurentDataState {
  final String message;
  const Error({required this.message});
}
