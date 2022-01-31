import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dinner_generator_app/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });
  mockDataConnectionChecker = MockDataConnectionChecker();
  networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.has connection',
        () async {
      //arrange
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      //act
      final result = networkInfoImpl.isConnected;
      //assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
