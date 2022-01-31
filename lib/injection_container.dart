import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dinner_generator_app/core/network/network_info.dart';
import 'package:dinner_generator_app/features/data/datasources/restaurent_data_source.dart';
import 'package:dinner_generator_app/features/data/datasources/restaurent_local_datasource.dart';
import 'package:dinner_generator_app/features/data/repositories/restaurent_repository_iml.dart';
import 'package:dinner_generator_app/features/domain/repositories/restaurent_repository.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_drinks.dart';
import 'package:dinner_generator_app/features/domain/usecases/get_restaurent_meals.dart';
import 'package:dinner_generator_app/features/presentations/cubit/restaurent_data_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! features
  // bloc
  sl.registerFactory(() => RestaurentDataCubit(
      getRestaurentDrinks: sl(),
      getRestaurentMeals: sl()));

  // use cases
  sl.registerLazySingleton(
      () => GetRestaurentMeals(sl()));
  sl.registerLazySingleton(
      () => GetRestaurentDrinks(sl()));

  // repository
  sl.registerLazySingleton<RestaurentRepository>(
      () => RestaurentRepositoryImpl(
          restaurentDataSource: sl(),
          restaurentLocalDataSource: sl(),
          networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<RestaurentDataSource>(
      () => RestaurentDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<
          RestaurentLocalDataSource>(
      () => RestaurentLocalDataSourceImpl());

  //! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl()));

  //! external
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(
      () => DataConnectionChecker());
}
