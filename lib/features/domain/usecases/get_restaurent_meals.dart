import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/core/error/failures.dart';
import 'package:dinner_generator_app/core/usecases/usecase.dart';
import 'package:dinner_generator_app/features/data/repositories/restaurent_repository_iml.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dinner_generator_app/features/domain/repositories/restaurent_repository.dart';

class GetRestaurentMeals
    implements UseCase<Meal> {
  final RestaurentRepository repository;

  GetRestaurentMeals(this.repository);

  @override
  Future<Either<Failure, List<Meal>>>?
      call() async {
    return await Future.value(
        repository.getMeals());
  }
}
