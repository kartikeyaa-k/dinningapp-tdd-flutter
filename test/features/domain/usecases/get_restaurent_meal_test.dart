import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dinner_generator_app/features/domain/repositories/restaurent_repository.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_meals.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRestaurentRepository extends Mock implements RestaurentRepository {}

void main() {
  GetRestaurentMeals usecase;
  MockRestaurentRepository mockRestaurentRepository;

  mockRestaurentRepository = MockRestaurentRepository();
  usecase = GetRestaurentMeals(mockRestaurentRepository);

  // ignore: prefer_const_constructors
  final tMeals = [
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

  test(
    'should get meal from the repository',
    () async {
      // arrange
      when(mockRestaurentRepository.getMeals())
          .thenAnswer((_) async => Right(tMeals));
      // act
      final result = await usecase();
      // assert
      expect(result, Right(tMeals));
      verify(mockRestaurentRepository.getMeals());
      verifyNoMoreInteractions(mockRestaurentRepository);
    },
  );
}
