import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/domain/usecases/cached_locations_usecase.dart';
import 'package:charge_locations_app/data/local/local_cache_service.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';

class FakeLocalCacheService implements LocalCacheService {
  Map<String, dynamic>? _cache;
  @override
  Future<void> saveLastSearch(String city, List<dynamic> data) async {
    _cache = {'city': city, 'data': data};
  }

  @override
  Future<Map<String, dynamic>?> getLastSearch() async {
    return _cache;
  }

  int? _bottomNavIndex;

  @override
  Future<int> getBottomNavIndex() async {
    return _bottomNavIndex ?? 0;
  }

  @override
  Future<void> saveBottomNavIndex(int index) async {
    _bottomNavIndex = index;
  }
}

void main() {
  group('CachedLocationsUsecase', () {
    late CachedLocationsUsecase usecase;
    late FakeLocalCacheService fakeCache;

    setUp(() {
      fakeCache = FakeLocalCacheService();
      usecase = CachedLocationsUsecase(fakeCache);
    });

    test(
      'getLastCachedLocations returns list of ChargeLocation if cached',
      () async {
        final city = 'Amsterdam';
        final data = [
          {
            'address': 'A, B',
            'city': city,
            'country': 'NL',
            'latitude': 1.0,
            'longitude': 2.0,
            'evses': [],
          },
        ];
        await fakeCache.saveLastSearch(city, data);
        final result = await usecase.getLastCachedLocations();
        expect(result, isA<List<ChargeLocation>>());
        expect(result!.first.address, 'A, B');
      },
    );

    test('getLastCachedLocations returns null if nothing cached', () async {
      final result = await usecase.getLastCachedLocations();
      expect(result, isNull);
    });

    test('saveLastSearch stores data in cache', () async {
      final city = 'Rotterdam';
      final data = [
        {
          'address': 'C, D',
          'city': city,
          'country': 'NL',
          'latitude': 3.0,
          'longitude': 4.0,
          'evses': [],
        },
      ];
      await usecase.saveLastSearch(city, data);
      final cached = await fakeCache.getLastSearch();
      expect(cached, isNotNull);
      expect(cached!['city'], city);
      expect((cached['data'] as List).first['address'], 'C, D');
    });
  });
}
