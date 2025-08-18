import '../providers/api_provider.dart';
import '../models/charge_location.dart';
import '../../domain/repositories/charge_location_repository.dart';

/// Repository for managing charge locations (implements domain interface)
class ChargeLocationRepositoryImpl implements ChargeLocationRepository {
  final ApiProvider apiProvider;

  ChargeLocationRepositoryImpl({required this.apiProvider});
  @override
  Future<List<ChargeLocation>> searchLocations(String city) async {
    final jsonList = await apiProvider.searchLocations(city);
    return jsonList
        .map<ChargeLocation>((json) => ChargeLocation.fromJson(json))
        .toList();
  }
}
