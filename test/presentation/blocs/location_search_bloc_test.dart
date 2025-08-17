import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/data/models/evse.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/presentation/blocs/location_search_bloc.dart';
import 'package:charge_locations_app/data/repositories/charge_location_repository.dart';

class MockRepository implements ChargeLocationRepository {
  @override
  Future<ChargeLocation> fetchLocationDetail(String locationId) async {
    return ChargeLocation(
      address: 'Address 1',
      city: 'Amsterdam',
      country: 'Netherlands',
      latitude: 52.3731,
      longitude: 4.8997,
      evses: [
        Evse(
          evseId: 'EVSE1',
          status: 'AVAILABLE',
          connectorType: 'IEC_62196_T2',
          powerType: 'AC_3_PHASE',
        ),
      ],
    );
  }

  @override
  Future<List<ChargeLocation>> searchLocations(String city) async {
    return [
      ChargeLocation(
        address: 'Address 1',
        city: 'Amsterdam',
        country: 'Netherlands',
        latitude: 52.3731,
        longitude: 4.8997,
        evses: [
          Evse(
            evseId: 'EVSE1',
            status: 'AVAILABLE',
            connectorType: 'IEC_62196_T2',
            powerType: 'AC_3_PHASE',
          ),
        ],
      ),
    ];
  }
}

void main() {
  test('LocationSearchBloc emits loaded state on success', () async {
    final repo = MockRepository();
    final bloc = LocationSearchBloc(repository: repo);

    bloc.add(SearchLocations('Amsterdam'));

    await expectLater(
      bloc.stream,
      emitsInOrder([isA<LocationSearchLoading>(), isA<LocationSearchLoaded>()]),
    );
  });
}
