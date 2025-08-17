import '../repositories/charge_location_repository.dart';
import '../../data/models/charge_location.dart';

/// Use case for fetching charge locations by city
class FetchLocations {
  final ChargeLocationRepository repository;

  FetchLocations(this.repository);

  Future<List<ChargeLocation>> call(String city) {
    return repository.searchLocations(city);
  }
}
