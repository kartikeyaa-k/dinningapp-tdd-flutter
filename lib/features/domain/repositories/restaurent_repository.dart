import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/core/error/failures.dart';
import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';

abstract class RestaurentRepository {
  Future<Either<Failure, List<Meal>>>? getMeals();
  Future<Either<Failure, List<Drink>>>?
      getDrinks();
}
