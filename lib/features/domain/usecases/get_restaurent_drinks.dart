import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/core/error/failures.dart';
import 'package:dinner_generator_app/core/usecases/usecase.dart';
import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/features/domain/repositories/restaurent_repository.dart';

class GetRestaurentDrinks
    implements UseCase<Drink> {
  final RestaurentRepository repository;

  GetRestaurentDrinks(this.repository);

  @override
  Future<Either<Failure, List<Drink>>>?
      call() async {
    return await Future.value(
        repository.getDrinks());
  }
}
