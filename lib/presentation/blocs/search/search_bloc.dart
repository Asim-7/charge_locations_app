import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/fetch_locations_usecase.dart';

/// Bloc for managing location search
class LocationSearchBloc
    extends Bloc<LocationSearchEvent, LocationSearchState> {
  final FetchLocationsUsecase fetchLocations;

  LocationSearchBloc({required this.fetchLocations})
    : super(LocationSearchInitial()) {
    on<SearchLocations>((event, emit) async {
      emit(LocationSearchLoading());
      try {
        final locations = await fetchLocations(event.city);
        emit(LocationSearchLoaded(locations));
      } catch (e) {
        emit(LocationSearchError(e.toString()));
      }
    });
  }
}
