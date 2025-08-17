import 'package:charge_locations_app/domain/usecases/fetch_location_detail_usecase.dart';
import 'package:charge_locations_app/presentation/blocs/detail/detail_event.dart';
import 'package:charge_locations_app/presentation/blocs/detail/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc for managing location details
/// This is just example implementation, there is not used yet
class LocationDetailBloc
    extends Bloc<LocationDetailEvent, LocationDetailState> {
  final FetchLocationDetailUsecase fetchLocationDetail;

  LocationDetailBloc({required this.fetchLocationDetail})
    : super(LocationDetailInitial()) {
    on<FetchLocationDetail>((event, emit) async {
      emit(LocationDetailLoading());
      try {
        final location = await fetchLocationDetail(event.locationId);
        emit(LocationDetailLoaded(location));
      } catch (e) {
        emit(LocationDetailError(e.toString()));
      }
    });
  }
}
