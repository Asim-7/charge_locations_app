import 'package:charge_locations_app/presentation/blocs/detail/detail_event.dart';
import 'package:charge_locations_app/presentation/blocs/detail/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/charge_location_repository.dart';

class LocationDetailBloc
    extends Bloc<LocationDetailEvent, LocationDetailState> {
  final ChargeLocationRepository repository;

  LocationDetailBloc({required this.repository})
    : super(LocationDetailInitial()) {
    on<FetchLocationDetail>((event, emit) async {
      emit(LocationDetailLoading());
      try {
        final location = await repository.fetchLocationDetail(event.locationId);
        emit(LocationDetailLoaded(location));
      } catch (e) {
        emit(LocationDetailError(e.toString()));
      }
    });
  }
}
