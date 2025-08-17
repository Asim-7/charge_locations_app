import '../../data/repositories/charge_location_repository.dart';
import '../../data/models/charge_location.dart';

/// Use case for fetching charge locations by city
class FetchLocationsUsecase {
  final ChargeLocationRepository repository;

  FetchLocationsUsecase(this.repository);

  Future<List<ChargeLocation>> call(String city) {
    return repository.searchLocations(city);
  }
}
