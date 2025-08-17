import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';

void main() {
  test('ChargeLocation parsing and availableEvseCount', () {
    final json = {
      "address": "Prins Hendrikkade 72, 1012 AC Amsterdam",
      "city": "Amsterdam",
      "country": "Netherlands",
      "latitude": 52.3731,
      "longitude": 4.8997,
      'evses': [
        {
          "evseId": "NL-AMS-0001",
          "status": "AVAILABLE",
          "connectorType": "IEC_62196_T2",
          "powerType": "AC_3_PHASE",
        },
        {
          "evseId": "NL-AMS-0002",
          "status": "CHARGING",
          "connectorType": "IEC_62196_T2_COMBO",
          "powerType": "DC",
        },
        {
          "evseId": "NL-AMS-0003",
          "status": "AVAILABLE",
          "connectorType": "IEC_62196_T2",
          "powerType": "AC_3_PHASE",
        },
      ],
    };
    final location = ChargeLocation.fromJson(json);
    expect(location.city, 'Amsterdam');
    expect(location.address, 'Prins Hendrikkade 72, 1012 AC Amsterdam');
    expect(location.availableEvseCount, 2);
  });
}
