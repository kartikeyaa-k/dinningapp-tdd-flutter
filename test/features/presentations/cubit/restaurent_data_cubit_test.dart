import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dinner_generator_app/features/domain/repositories/restaurent_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_drinks.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_meals.dart';
import 'package:dinner_generator_app/features/presentations/cubit/restaurent_data_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// import 'restaurent_data_cubit_test.mocks.dart';

class MockGetRestaurentMeals extends Mock
    implements GetRestaurentMeals {}

class MockGetRestaurentDrinks extends Mock
    implements GetRestaurentDrinks {}

@GenerateMocks([
  MockGetRestaurentMeals,
  MockGetRestaurentDrinks
])
void main() {
  MockGetRestaurentMeals mockGetRestaurentMeals;
  MockGetRestaurentDrinks mockGetRestaurentDrinks;

  setUp(() {
    mockGetRestaurentMeals =
        MockGetRestaurentMeals();
    mockGetRestaurentDrinks =
        MockGetRestaurentDrinks();
  });
  mockGetRestaurentMeals =
      MockGetRestaurentMeals();
  mockGetRestaurentDrinks =
      MockGetRestaurentDrinks();
  final meals = [
    const Meal(
        idMeal: '1',
        strMeal: 'strMeal',
        strCategory: 'strCategory',
        strArea: 'strArea',
        strInstructions: 'strInstructions',
        strMealThumb: 'strMealThumb',
        strTags: 'strTags',
        strYoutube: 'strYoutube')
  ];
  blocTest<RestaurentDataCubit,
      RestaurentDataState>(
    'emits [Loading, LoadedMeals] when successful',
    build: () {
      when(mockGetRestaurentMeals())
          .thenAnswer((_) async => Right(meals));
      return RestaurentDataCubit(
          getRestaurentMeals:
              mockGetRestaurentMeals,
          getRestaurentDrinks:
              mockGetRestaurentDrinks);
    },
    act: (bloc) async =>
        await bloc.getMealsCubit(),
    expect: () => [
      Loading(),
      LoadedMeals(meals: meals),
    ],
  );
}
