import 'evse.dart';

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

  int get availableEvseCount =>
      evses.where((e) => e.status == 'AVAILABLE').length;
}
