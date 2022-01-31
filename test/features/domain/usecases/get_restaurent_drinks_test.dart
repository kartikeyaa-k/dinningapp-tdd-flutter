import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dinner_generator_app/features/domain/repositories/restaurent_repository.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_drinks.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_meals.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRestaurentRepository extends Mock implements RestaurentRepository {}

void main() {
  GetRestaurentDrinks usecase;
  MockRestaurentRepository mockRestaurentRepository;

  mockRestaurentRepository = MockRestaurentRepository();
  usecase = GetRestaurentDrinks(mockRestaurentRepository);

  // ignore: prefer_const_constructors
  final tDrink = [
    const Drink(
        idDrink: 'idDrink',
        strDrink: 'strDrink',
        strCategory: 'strCategory',
        strAlcoholic: 'strAlcoholic',
        strDrinkThumb: 'strDrinkThumb',
        strGlass: 'strGlass',
        strInstructions: 'strInstructions')
  ];
  test(
    'should get drink from the repository',
    () async {
      // arrange
      when(mockRestaurentRepository.getDrinks())
          .thenAnswer((_) async => Right(tDrink));
      // act
      final result = await usecase();
      // assert
      expect(result, Right(tDrink));
      verify(mockRestaurentRepository.getDrinks());
      verifyNoMoreInteractions(mockRestaurentRepository);
    },
  );
}
