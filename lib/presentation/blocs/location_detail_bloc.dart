import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/charge_location_repository.dart';
import '../../data/models/charge_location.dart';
import 'package:equatable/equatable.dart';

abstract class LocationDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchLocationDetail extends LocationDetailEvent {
  final String locationId;
  FetchLocationDetail(this.locationId);

  @override
  List<Object?> get props => [locationId];
}

abstract class LocationDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationDetailInitial extends LocationDetailState {}

class LocationDetailLoading extends LocationDetailState {}

class LocationDetailLoaded extends LocationDetailState {
  final ChargeLocation location;
  LocationDetailLoaded(this.location);

  @override
  List<Object?> get props => [location];
}

class LocationDetailError extends LocationDetailState {
  final String message;
  LocationDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

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
