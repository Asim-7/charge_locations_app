import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/data/repositories/charge_location_repository_impl.dart';
import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/data/providers/api_provider.dart';

import 'package:http/http.dart' as http;

class FakeApiProvider implements ApiProvider {
  @override
  http.Client get client => throw UnimplementedError();
  @override
  Future<List<dynamic>> searchLocations(String city) async {
    return [
      {
        'address': 'A, B',
        'city': city,
        'country': 'NL',
        'latitude': 1.0,
        'longitude': 2.0,
        'evses': [],
      },
      {
        'address': 'C, D',
        'city': city,
        'country': 'NL',
        'latitude': 3.0,
        'longitude': 4.0,
        'evses': [],
      },
    ];
  }
}

void main() {
  group('ChargeLocationRepositoryImpl', () {
    test('searchLocations returns list of ChargeLocation', () async {
      final repo = ChargeLocationRepositoryImpl(apiProvider: FakeApiProvider());
      final result = await repo.searchLocations('Amsterdam');
      expect(result, isA<List<ChargeLocation>>());
      expect(result.length, 2);
      expect(result[0].address, 'A, B');
      expect(result[1].address, 'C, D');
    });
  });
}
