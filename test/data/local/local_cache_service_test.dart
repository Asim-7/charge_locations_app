import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charge_locations_app/data/local/local_cache_service.dart';

void main() {
  group('LocalCacheService', () {
    late LocalCacheService cacheService;

    setUp(() {
      cacheService = LocalCacheService();
      SharedPreferences.setMockInitialValues({});
    });

    test(
      'saveLastSearch and getLastSearch store and retrieve city and data',
      () async {
        const city = 'Amsterdam';
        final data = [
          {'id': 1, 'name': 'Station A'},
          {'id': 2, 'name': 'Station B'},
        ];

        await cacheService.saveLastSearch(city, data);
        final result = await cacheService.getLastSearch();

        expect(result, isNotNull);
        expect(result!['city'], city);
        expect(result['data'], data);
      },
    );

    test('getLastSearch returns null if nothing is cached', () async {
      final result = await cacheService.getLastSearch();
      expect(result, isNull);
    });
  });
}
