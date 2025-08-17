import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:equatable/equatable.dart';

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
