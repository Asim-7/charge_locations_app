import 'package:charge_locations_app/domain/repositories/charge_location_repository.dart';

import '../../data/models/charge_location.dart';

/// Use case for fetching a single charge location's detail by ID
class FetchLocationDetailUsecase {
  final ChargeLocationRepository repository;

  FetchLocationDetailUsecase(this.repository);

  Future<ChargeLocation> call(String locationId) {
    return repository.fetchLocationDetail(locationId);
  }
}
