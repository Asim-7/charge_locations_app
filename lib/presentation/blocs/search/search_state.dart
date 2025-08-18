import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:equatable/equatable.dart';

/// Base class for all search states
/// States can be initial, loading, loaded, or error
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

class LocationSearchCacheLoaded extends LocationSearchState {
  final List<dynamic> cachedLocations;
  LocationSearchCacheLoaded(this.cachedLocations);
}
