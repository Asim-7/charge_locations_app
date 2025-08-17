import '../providers/api_provider.dart';
import '../models/charge_location.dart';

class ChargeLocationRepository {
  final _api = ApiProvider();

  Future<List<ChargeLocation>> searchLocations(String city) async {
    final jsonList = await _api.searchLocations(city);
    return jsonList
        .map<ChargeLocation>((json) => ChargeLocation.fromJson(json))
        .toList();
  }

  Future<ChargeLocation> fetchLocationDetail(String locationId) async {
    final json = await _api.getLocationDetail(locationId);
    return ChargeLocation.fromJson(json);
  }
}
