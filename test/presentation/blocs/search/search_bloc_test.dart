import 'package:charge_locations_app/presentation/blocs/search/search_bloc.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:charge_locations_app/domain/usecases/cached_locations_usecase.dart';
import 'package:charge_locations_app/domain/usecases/fetch_locations_usecase.dart';
import 'search_bloc_test.mocks.dart';

// Mock the dependencies using: "flutter pub run build_runner build" in cmd
@GenerateMocks([FetchLocationsUsecase, CachedLocationsUsecase])
void main() {
  test('LocationSearchBloc emits loaded state on success', () async {
    final fetchLocations = MockFetchLocationsUsecase();
    final cachedLocationsUsecase = MockCachedLocationsUsecase();

    // Stub the methods
    when(
      fetchLocations.call(any),
    ).thenAnswer((_) async => [/* dummy ChargeLocation */]);
    when(
      cachedLocationsUsecase.getLastCachedLocations(),
    ).thenAnswer((_) async => [/* dummy ChargeLocation */]);
    when(
      cachedLocationsUsecase.saveLastSearch(any, any),
    ).thenAnswer((_) async {});

    final bloc = LocationSearchBloc(
      fetchLocations: fetchLocations,
      cachedLocationsUsecase: cachedLocationsUsecase,
    );

    bloc.add(SearchLocations('Amsterdam'));

    await expectLater(
      bloc.stream,
      emitsInOrder([isA<LocationSearchLoading>(), isA<LocationSearchLoaded>()]),
    );
  });
}
