import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/data/repositories/charge_location_repository_impl.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/data/providers/api_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'charge_location_repository_impl_test.mocks.dart';

// Mock the dependencies using: "flutter pub run build_runner build" in cmd
@GenerateMocks([ApiProvider])
void main() {
  late ApiProvider apiProvider;
  late ChargeLocationRepositoryImpl repository;

  setUp(() {
    apiProvider = MockApiProvider();
    repository = ChargeLocationRepositoryImpl(apiProvider: apiProvider);

    when(apiProvider.searchLocations('Amsterdam')).thenAnswer(
      (_) async => [
        {
          'address': 'A, B',
          'city': 'Amsterdam',
          'country': 'NL',
          'latitude': 1.0,
          'longitude': 2.0,
          'evses': [],
        },
        {
          'address': 'C, D',
          'city': 'Amsterdam',
          'country': 'NL',
          'latitude': 3.0,
          'longitude': 4.0,
          'evses': [],
        },
      ],
    );
  });

  group('ChargeLocationRepositoryImpl', () {
    test('searchLocations returns list of ChargeLocation', () async {
      final result = await repository.searchLocations('Amsterdam');
      expect(result, isA<List<ChargeLocation>>());
      expect(result.length, 2);
      expect(result[0].address, 'A, B');
      expect(result[1].address, 'C, D');
    });
  });
}
