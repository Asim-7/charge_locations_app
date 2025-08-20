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
  late MockFetchLocationsUsecase fetchLocations;
  late MockCachedLocationsUsecase cachedLocationsUsecase;
  late LocationSearchBloc bloc;

  setUp(() {
    fetchLocations = MockFetchLocationsUsecase();
    cachedLocationsUsecase = MockCachedLocationsUsecase();
    bloc = LocationSearchBloc(
      fetchLocations: fetchLocations,
      cachedLocationsUsecase: cachedLocationsUsecase,
    );
    // Common stubs
    when(fetchLocations.call(any)).thenAnswer((_) async => []);
    when(
      cachedLocationsUsecase.getLastCachedLocations(),
    ).thenAnswer((_) async => []);
    when(
      cachedLocationsUsecase.saveLastSearch(any, any),
    ).thenAnswer((_) async {});
  });

  tearDown(() {
    bloc.close();
  });

  test('LocationSearchBloc emits loaded state on success', () async {
    bloc.add(SearchLocations('Amsterdam'));

    await expectLater(
      bloc.stream,
      emitsInOrder([isA<LocationSearchLoading>(), isA<LocationSearchLoaded>()]),
    );
  });
}
