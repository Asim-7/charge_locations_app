import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/domain/usecases/cached_locations_usecase.dart';
import 'package:charge_locations_app/data/local/local_cache_service.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'cached_locations_usecase_test.mocks.dart';

// Mock the dependencies using: "flutter pub run build_runner build" in cmd
@GenerateMocks([LocalCacheService])
void main() {
  late LocalCacheService localCacheService;
  late CachedLocationsUsecase usecase;

  setUp(() {
    localCacheService = MockLocalCacheService();
    usecase = CachedLocationsUsecase(localCacheService);
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
      when(
        localCacheService.getLastSearch(),
      ).thenAnswer((_) async => {'city': city, 'data': data});
      final result = await usecase.getLastCachedLocations();
      expect(result, isA<List<ChargeLocation>>());
      expect(result!.first.address, 'A, B');
      verify(localCacheService.getLastSearch()).called(1);
    },
  );

  test('getLastCachedLocations returns null if nothing cached', () async {
    when(localCacheService.getLastSearch()).thenAnswer((_) async => null);
    final result = await usecase.getLastCachedLocations();
    expect(result, isNull);
    verify(localCacheService.getLastSearch()).called(1);
  });

  test('saveLastSearch calls LocalCacheService.saveLastSearch', () async {
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
    when(localCacheService.saveLastSearch(city, data)).thenAnswer((_) async {});
    await usecase.saveLastSearch(city, data);
    verify(localCacheService.saveLastSearch(city, data)).called(1);
  });
}
