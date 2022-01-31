import 'package:dartz/dartz.dart';
import 'package:dinner_generator_app/core/error/exceptions.dart';
import 'package:dinner_generator_app/core/error/failures.dart';
import 'package:dinner_generator_app/core/network/network_info.dart';
import 'package:dinner_generator_app/features/data/datasources/restaurent_data_source.dart';
import 'package:dinner_generator_app/features/data/datasources/restaurent_local_datasource.dart';
import 'package:dinner_generator_app/features/data/repositories/restaurent_repository_iml.dart';
import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:dinner_generator_app/features/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRestaurentDataSource extends Mock
    implements RestaurentDataSource {}

class MockRestaurentLocalSource extends Mock
    implements RestaurentLocalDataSource {}

class MockNetworkInfo extends Mock
    implements NetworkInfo {}

void main() {
  RestaurentRepositoryImpl repositoryImpl;
  MockRestaurentDataSource
      mockRestaurentDataSource;
  MockRestaurentLocalSource
      mockRestaurentLocalSource;
  MockNetworkInfo mockNetworkInfo;
  setUpAll(() {
    mockRestaurentDataSource =
        MockRestaurentDataSource();
    mockRestaurentLocalSource =
        MockRestaurentLocalSource();
    mockNetworkInfo = MockNetworkInfo();

    repositoryImpl = RestaurentRepositoryImpl(
        restaurentDataSource:
            mockRestaurentDataSource,
        restaurentLocalDataSource:
            mockRestaurentLocalSource,
        networkInfo: mockNetworkInfo);
  });
  mockRestaurentDataSource =
      MockRestaurentDataSource();
  mockRestaurentLocalSource =
      MockRestaurentLocalSource();
  mockNetworkInfo = MockNetworkInfo();

  repositoryImpl = RestaurentRepositoryImpl(
      restaurentDataSource:
          mockRestaurentDataSource,
      restaurentLocalDataSource:
          mockRestaurentLocalSource,
      networkInfo: mockNetworkInfo);

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('get meals ', () {
    final tListMealModel = [
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

    final List<Meal> tListMeal = tListMealModel;

    test('should check if the device is online',
        () async {
      //arrange
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
      //act
      await repositoryImpl.getMeals();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when call to remote data source is success',
          () async {
        //arrange
        when(mockRestaurentDataSource.getMeals())
            .thenAnswer(
                (_) async => tListMealModel);
        //act
        final result =
            await repositoryImpl.getMeals();
        //assert
        expect(result, Right(tListMeal));
      });

      test(
          'should cache remote data when call to remote data source is success',
          () async {
        //arrange
        when(mockRestaurentDataSource.getMeals())
            .thenAnswer(
                (_) async => tListMealModel);
        //act
        final result =
            await repositoryImpl.getMeals();
        //assert
      });

      test(
          'should return server failure when the call to remote data source is unsuccess',
          () async {
        //arrange
        when(mockRestaurentDataSource.getMeals())
            .thenThrow(ServerExceptions());
        //act
        final result =
            await repositoryImpl.getMeals();
        //assert
        verify(
            mockRestaurentDataSource.getMeals());
        verifyZeroInteractions(
            mockRestaurentDataSource);
        expect(result,
            equals(Left(ServerExceptions())));
      });
    });

    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockRestaurentDataSource.getMeals())
            .thenAnswer(
                (_) async => tListMealModel);

        // act
        final result =
            await repositoryImpl.getMeals();
        // assert
        verifyZeroInteractions(
            mockRestaurentDataSource);
        verify(
            mockRestaurentDataSource.getMeals());
        expect(result, equals(Right(tListMeal)));
      });

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockRestaurentLocalSource
                  .getMeals())
              .thenThrow(CacheExceptions());
          // act
          final result =
              await repositoryImpl.getMeals();
          // assert
          verifyZeroInteractions(
              mockRestaurentDataSource);
          verify(mockRestaurentLocalSource
              .getMeals());
          expect(result,
              equals(Left(CacheFailure())));
        },
      );
    });
  });

  group('get drinks ', () {
    final tListDrinkModel = [
      const Drink(
          idDrink: 'idDrink',
          strDrink: 'strDrink',
          strCategory: 'strCategory',
          strAlcoholic: 'strAlcoholic',
          strDrinkThumb: 'strDrinkThumb',
          strGlass: 'strGlass',
          strInstructions: 'strInstructions')
    ];

    final List<Drink> tListDrink =
        tListDrinkModel;

    test('should check if the device is online',
        () async {
      //arrange
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
      //act
      await repositoryImpl.getDrinks();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when call to remote data source is success',
          () async {
        //arrange
        when(mockRestaurentDataSource.getDrinks())
            .thenAnswer(
                (_) async => tListDrinkModel);
        //act
        final result =
            await repositoryImpl.getDrinks();
        //assert
        expect(result, Right(tListDrink));
      });

      test(
          'should cache remote data when call to remote data source is success',
          () async {
        //arrange
        when(mockRestaurentDataSource.getDrinks())
            .thenAnswer(
                (_) async => tListDrinkModel);
        //act
        final result =
            await repositoryImpl.getDrinks();
        //assert
      });

      test(
          'should return server failure when the call to remote data source is unsuccess',
          () async {
        //arrange
        when(mockRestaurentDataSource.getDrinks())
            .thenThrow(ServerExceptions());
        //act
        final result =
            await repositoryImpl.getDrinks();
        //assert
        verify(
            mockRestaurentDataSource.getDrinks());

        expect(result,
            equals(Left(ServerExceptions())));
      });
    });

    runTestsOffline(() {
      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockRestaurentDataSource.getDrinks())
            .thenAnswer(
                (_) async => tListDrinkModel);

        // act
        final result =
            await repositoryImpl.getDrinks();
        // assert
        verifyZeroInteractions(
            mockRestaurentDataSource);
        verify(
            mockRestaurentDataSource.getDrinks());
        expect(result, equals(Right(tListDrink)));
      });

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockRestaurentLocalSource
                  .getDrinks())
              .thenThrow(CacheExceptions());
          // act
          final result =
              await repositoryImpl.getDrinks();
          // assert
          verifyZeroInteractions(
              mockRestaurentDataSource);
          verify(mockRestaurentLocalSource
              .getDrinks());
          expect(result,
              equals(Left(CacheFailure())));
        },
      );
    });
  });
}
