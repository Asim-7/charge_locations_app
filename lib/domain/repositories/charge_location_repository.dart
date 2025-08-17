import '../../data/models/charge_location.dart';

abstract class ChargeLocationRepository {
  Future<List<ChargeLocation>> searchLocations(String city);
  Future<ChargeLocation> fetchLocationDetail(String locationId);
}
