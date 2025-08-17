import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/presentation/blocs/location_search_bloc.dart';
import 'package:charge_locations_app/data/repositories/charge_location_repository.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements ChargeLocationRepository {}

void main() {
  test('LocationSearchBloc emits loaded state on success', () async {
    final repo = MockRepository();
    when(repo.searchLocations('Amsterdam')).thenAnswer((_) async => []);
    final bloc = LocationSearchBloc(repository: repo);

    bloc.add(SearchLocations('Amsterdam'));

    await expectLater(
      bloc.stream,
      emitsInOrder([isA<LocationSearchLoading>(), isA<LocationSearchLoaded>()]),
    );
  });
}
