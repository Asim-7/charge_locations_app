import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/domain/usecases/fetch_locations_usecase.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/domain/repositories/charge_location_repository.dart';

class FakeChargeLocationRepository implements ChargeLocationRepository {
  List<ChargeLocation>? locationsToReturn;
  String? lastSearchedCity;

  @override
  Future<List<ChargeLocation>> searchLocations(String city) async {
    lastSearchedCity = city;
    return locationsToReturn ?? [];
  }
}

void main() {
  group('FetchLocationsUsecase', () {
    late FakeChargeLocationRepository fakeRepository;
    late FetchLocationsUsecase usecase;

    setUp(() {
      fakeRepository = FakeChargeLocationRepository();
      usecase = FetchLocationsUsecase(fakeRepository);
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
      fakeRepository.locationsToReturn = locations;
      final result = await usecase('Amsterdam');
      expect(result, equals(locations));
      expect(fakeRepository.lastSearchedCity, 'Amsterdam');
    });

    test('returns empty list if repository returns nothing', () async {
      fakeRepository.locationsToReturn = [];
      final result = await usecase('Rotterdam');
      expect(result, isEmpty);
      expect(fakeRepository.lastSearchedCity, 'Rotterdam');
    });
  });
}
