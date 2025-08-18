/// Model representing an EVSE (Electric Vehicle Supply Equipment)
class Evse {
  final String evseId;
  final String status;
  final String connectorType;
  final String powerType;

  Evse({
    required this.evseId,
    required this.status,
    required this.connectorType,
    required this.powerType,
  });

  /// Creates an Evse instance from JSON data
  factory Evse.fromJson(Map<String, dynamic> json) {
    return Evse(
      evseId: json['evseId'] ?? '',
      status: json['status'] ?? '',
      connectorType: json['connectorType'] ?? '',
      powerType: json['powerType'] ?? '',
    );
  }

  /// Converts the Evse instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'evseId': evseId,
      'status': status,
      'connectorType': connectorType,
      'powerType': powerType,
    };
  }
}
