import 'package:equatable/equatable.dart';

/// Base event class for location search events
/// Events can be searching locations or refreshing them
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
