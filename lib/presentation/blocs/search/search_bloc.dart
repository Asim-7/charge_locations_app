import 'package:charge_locations_app/presentation/blocs/search/search_event.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/charge_location_repository.dart';

class LocationSearchBloc
    extends Bloc<LocationSearchEvent, LocationSearchState> {
  final ChargeLocationRepository repository;

  LocationSearchBloc({required this.repository})
    : super(LocationSearchInitial()) {
    on<SearchLocations>((event, emit) async {
      emit(LocationSearchLoading());
      try {
        final locations = await repository.searchLocations(event.city);
        emit(LocationSearchLoaded(locations));
      } catch (e) {
        emit(LocationSearchError(e.toString()));
      }
    });
  }
}
