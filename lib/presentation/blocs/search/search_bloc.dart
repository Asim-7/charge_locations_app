import 'package:charge_locations_app/domain/usecases/cached_locations_usecase.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/fetch_locations_usecase.dart';

/// Bloc for managing location search
class LocationSearchBloc
    extends Bloc<LocationSearchEvent, LocationSearchState> {
  final FetchLocationsUsecase fetchLocations;
  final CachedLocationsUsecase cachedLocationsUsecase;

  LocationSearchBloc({
    required this.fetchLocations,
    required this.cachedLocationsUsecase,
  }) : super(LocationSearchInitial()) {
    // Fetch locations based on city
    on<SearchLocations>((event, emit) async {
      emit(LocationSearchLoading());
      try {
        final locations = await fetchLocations(event.city);
        // Save to cache (convert to List<dynamic> for storage)
        await cachedLocationsUsecase.saveLastSearch(
          event.city,
          locations.map((e) => e.toJson()).toList(),
        );
        emit(LocationSearchLoaded(locations));
      } catch (e) {
        emit(LocationSearchError(e.toString()));
      }
    });

    // Loading cached locations on initialization
    on<LoadCachedLocations>((event, emit) async {
      final cached = await cachedLocationsUsecase.getLastCachedLocations();
      if (cached != null && cached.isNotEmpty) {
        emit(LocationSearchLoaded(cached));
      }
    });
  }
}
