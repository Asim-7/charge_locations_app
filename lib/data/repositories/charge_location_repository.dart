import '../providers/api_provider.dart';
import '../models/charge_location.dart';

/// Repository for managing charge locations
class ChargeLocationRepository {
  final _api = ApiProvider();

  /// Searches for charge locations in a specific city
  /// @param city The name of the city to search for charge locations
  Future<List<ChargeLocation>> searchLocations(String city) async {
    final jsonList = await _api.searchLocations(city);
    return jsonList
        .map<ChargeLocation>((json) => ChargeLocation.fromJson(json))
        .toList();
  }

  /// Fetches detailed information about a specific charge location by its ID
  /// @param locationId The ID of the charge location to fetch details
  Future<ChargeLocation> fetchLocationDetail(String locationId) async {
    final json = await _api.getLocationDetail(locationId);
    return ChargeLocation.fromJson(json);
  }
}
