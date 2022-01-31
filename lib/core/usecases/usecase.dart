import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/core/error/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, List<Type>>>? call();
}
