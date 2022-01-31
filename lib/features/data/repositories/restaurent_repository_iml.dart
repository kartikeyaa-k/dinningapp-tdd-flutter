import 'package:dinner_generator_app/core/error/exceptions.dart';
import 'package:dinner_generator_app/core/network/network_info.dart';
import 'package:dinner_generator_app/features/data/datasources/restaurent_data_source.dart';
import 'package:dinner_generator_app/features/data/datasources/restaurent_local_datasource.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/core/error/failures.dart';
import 'package:dinner_generator_app/core/error/exceptions.dart';

import 'package:dartz/dartz.dart';

import 'package:dinner_generator_app/features/domain/repositories/restaurent_repository.dart';
import 'package:dio/dio.dart';

class RestaurentRepositoryImpl
    implements RestaurentRepository {
  final RestaurentDataSource restaurentDataSource;
  final RestaurentLocalDataSource
      restaurentLocalDataSource;
  final NetworkInfo networkInfo;

  RestaurentRepositoryImpl(
      {required this.restaurentDataSource,
      required this.restaurentLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Drink>>>
      getDrinks() async {
    if (await networkInfo.isConnected ?? false) {
      try {
        final remoteDrinks =
            await restaurentDataSource
                .getDrinks();
        if (remoteDrinks == null) {
          return Left(ServerFailure());
        } else {
          await restaurentLocalDataSource
              .cacheDrinks(remoteDrinks);
          return Right(remoteDrinks);
        }
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDrinks =
            await restaurentLocalDataSource
                .getDrinks();
        if (localDrinks == null) {
          return Left(CacheFailure());
        } else {
          return Right(localDrinks);
        }
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Meal>>>
      getMeals() async {
    if (await networkInfo.isConnected ?? false) {
      try {
        final remoteMeals =
            await restaurentDataSource.getMeals();
        if (remoteMeals == null) {
          return Left(ServerFailure());
        } else {
          await restaurentLocalDataSource
              .cacheMeals(remoteMeals);
          return Right(remoteMeals);
        }
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMeals =
            await restaurentLocalDataSource
                .getMeals();
        if (localMeals == null) {
          return Left(CacheFailure());
        } else {
          return Right(localMeals);
        }
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }
}
