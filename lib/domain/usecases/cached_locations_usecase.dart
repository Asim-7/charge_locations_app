import 'package:charge_locations_app/data/local/local_cache_service.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';

class CachedLocationsUsecase {
  final LocalCacheService cacheService;
  CachedLocationsUsecase(this.cacheService);

  Future<List<ChargeLocation>?> getLastCachedLocations() async {
    final cached = await cacheService.getLastSearch();
    if (cached != null) {
      return (cached['data'] as List)
          .map((item) => ChargeLocation.fromJson(item))
          .toList();
    }
    return null;
  }

  Future<void> saveLastSearch(String city, List<dynamic> data) async {
    await cacheService.saveLastSearch(city, data);
  }

  Future<int> getBottomNavIndex() async {
    return await cacheService.getBottomNavIndex();
  }

  Future<void> saveBottomNavIndex(int index) async {
    await cacheService.saveBottomNavIndex(index);
  }
}
