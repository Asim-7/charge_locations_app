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
