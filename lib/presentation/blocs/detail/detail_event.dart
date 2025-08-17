import 'package:equatable/equatable.dart';

/// Base event class for location detail events
/// Events can be fetching location details or refreshing them
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
