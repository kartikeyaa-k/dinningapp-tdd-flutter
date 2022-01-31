import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/core/error/exceptions.dart';
import 'package:dinner_generator_app/features/data/models/drink_model.dart';
import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dio/dio.dart';
import 'package:dinner_generator_app/features/data/models/meal_model.dart';

abstract class RestaurentDataSource {
  /// calls the api to get meals and drinks
  Future<List<Meal>>? getMeals();
  Future<List<Drink>>? getDrinks();
}

class RestaurentDataSourceImpl
    implements RestaurentDataSource {
  late final Dio dio;
  RestaurentDataSourceImpl({required this.dio});

  @override
  Future<List<Drink>> getDrinks() async {
    final response = await dio.get(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a');

    if (response.statusCode == 200) {
      return DrinkResponseModel.fromJson(
              response.data)
          .drinks;
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<List<Meal>> getMeals() async {
    final response = await dio.get(
        'https://www.themealdb.com/api/json/v1/1/search.php?f=a');

    if (response.statusCode == 200) {
      return MealResponseModel.fromJson(
              response.data)
          .meals;
    } else {
      throw ServerExceptions();
    }
  }
}
