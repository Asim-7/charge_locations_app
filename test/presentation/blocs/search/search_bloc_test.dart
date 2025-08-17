import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/data/models/evse.dart';
import 'package:charge_locations_app/domain/repositories/charge_location_repository.dart';
import 'package:charge_locations_app/domain/usecases/fetch_locations_usecase.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_bloc.dart';

import '../../../data/repositories/mock_repository.dart';

class MockFetchLocationsUsecase implements FetchLocationsUsecase {
  @override
  Future<List<ChargeLocation>> call(String city) async {
    return [
      ChargeLocation(
        address: 'Address 1',
        city: city,
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

  @override
  ChargeLocationRepository get repository => MockRepository();
}

void main() {
  test('LocationSearchBloc emits loaded state on success', () async {
    final fetchLocations = MockFetchLocationsUsecase();
    final bloc = LocationSearchBloc(fetchLocations: fetchLocations);

    bloc.add(SearchLocations('Amsterdam'));

    await expectLater(
      bloc.stream,
      emitsInOrder([isA<LocationSearchLoading>(), isA<LocationSearchLoaded>()]),
    );
  });
}
