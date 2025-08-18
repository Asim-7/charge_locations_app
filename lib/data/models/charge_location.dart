import 'evse.dart';

/// Model representing a charge location
class ChargeLocation {
  final String address;
  final String city;
  final String country;
  final double latitude;
  final double longitude;
  final List<Evse> evses;

  ChargeLocation({
    required this.address,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.evses,
  });

  /// Creates a ChargeLocation instance from JSON data
  factory ChargeLocation.fromJson(Map<String, dynamic> json) {
    return ChargeLocation(
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      evses:
          (json['evses'] as List<dynamic>? ?? [])
              .map((e) => Evse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  /// Returns the count of available EVSEs
  int get availableEvseCount =>
      evses.where((e) => e.status == 'AVAILABLE').length;

  /// Converts the ChargeLocation instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'evses': evses.map((e) => e.toJson()).toList(),
      // Add other fields as needed
    };
  }
}
