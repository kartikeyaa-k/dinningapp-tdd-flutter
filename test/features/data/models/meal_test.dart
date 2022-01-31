import 'dart:convert';

import 'package:dinner_generator_app/features/data/models/meal_model.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tMealModel = MealModel(
      idMeal: '52768',
      strMeal: 'strMeal',
      strCategory: 'strCategory',
      strArea: 'strArea',
      strInstructions: 'strInstructions',
      strMealThumb: 'strMealThumb',
      strTags: 'strTags',
      strYoutube: 'strYoutube');

  test('should be a subclass on Meal entity', () {
    //assert
    expect(tMealModel, isA<Meal>());
  });

  group('fromJson', () {
    test('should return a valid meal model', () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('meal.json'));
      print(jsonMap);
      // act
      final result = MealModel.fromJson(jsonMap['meals'][0]);
      // assert
      expect(result, equals(tMealModel));
    });
  });
}
