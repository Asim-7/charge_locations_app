import '../providers/api_provider.dart';
import '../models/charge_location.dart';
import '../../domain/repositories/charge_location_repository.dart';

/// Repository for managing charge locations (implements domain interface)
class ChargeLocationRepositoryImpl implements ChargeLocationRepository {
  final _api = ApiProvider();

  @override
  Future<List<ChargeLocation>> searchLocations(String city) async {
    final jsonList = await _api.searchLocations(city);
    return jsonList
        .map<ChargeLocation>((json) => ChargeLocation.fromJson(json))
        .toList();
  }
}
