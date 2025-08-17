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
