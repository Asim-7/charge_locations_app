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

  factory Evse.fromJson(Map<String, dynamic> json) {
    return Evse(
      evseId: json['evseId'] ?? '',
      status: json['status'] ?? '',
      connectorType: json['connectorType'] ?? '',
      powerType: json['powerType'] ?? '',
    );
  }
}
