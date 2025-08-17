import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/charge_location_repository.dart';
import '../../data/models/charge_location.dart';
import 'package:equatable/equatable.dart';

abstract class LocationSearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchLocations extends LocationSearchEvent {
  final String city;
  SearchLocations(this.city);

  @override
  List<Object?> get props => [city];
}

abstract class LocationSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationSearchInitial extends LocationSearchState {}

class LocationSearchLoading extends LocationSearchState {}

class LocationSearchLoaded extends LocationSearchState {
  final List<ChargeLocation> locations;
  LocationSearchLoaded(this.locations);

  @override
  List<Object?> get props => [locations];
}

class LocationSearchError extends LocationSearchState {
  final String message;
  LocationSearchError(this.message);

  @override
  List<Object?> get props => [message];
}

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
