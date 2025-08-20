import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/domain/usecases/fetch_locations_usecase.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/domain/repositories/charge_location_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'fetch_locations_usecase_test.mocks.dart';

// Mock the dependencies using: "flutter pub run build_runner build" in cmd
@GenerateMocks([ChargeLocationRepository])
void main() {
  late MockChargeLocationRepository chargeLocationRepositoryMock;
  late FetchLocationsUsecase usecase;

  setUp(() {
    chargeLocationRepositoryMock = MockChargeLocationRepository();
    usecase = FetchLocationsUsecase(chargeLocationRepositoryMock);
  });

  test('returns locations from repository', () async {
    final locations = [
      ChargeLocation(
        address: 'A, B',
        city: 'Amsterdam',
        country: 'NL',
        latitude: 1.0,
        longitude: 2.0,
        evses: [],
      ),
    ];
    when(
      chargeLocationRepositoryMock.searchLocations('Amsterdam'),
    ).thenAnswer((_) async => locations);
    final result = await usecase('Amsterdam');
    expect(result, equals(locations));
    verify(chargeLocationRepositoryMock.searchLocations('Amsterdam')).called(1);
  });

  test('returns empty list if repository returns nothing', () async {
    when(
      chargeLocationRepositoryMock.searchLocations('Rotterdam'),
    ).thenAnswer((_) async => []);
    final result = await usecase('Rotterdam');
    expect(result, isEmpty);
    verify(chargeLocationRepositoryMock.searchLocations('Rotterdam')).called(1);
  });
}
