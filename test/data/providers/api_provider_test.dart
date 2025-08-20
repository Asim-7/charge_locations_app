import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:charge_locations_app/data/providers/api_provider.dart';
import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('ApiProvider', () {
    test('searchLocations returns data on 200 response with list', () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          jsonEncode([
            {'id': 1, 'name': 'Station A'},
            {'id': 2, 'name': 'Station B'},
          ]),
          200,
        );
      });
      final api = ApiProvider(client: mockClient);
      final result = await api.searchLocations('Amsterdam');
      expect(result, isA<List<dynamic>>());
      expect(result.length, 2);
      expect(result[0]['name'], 'Station A');
    });

    test('searchLocations throws on 200 response with non-list', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({'foo': 'bar'}), 200);
      });
      final api = ApiProvider(client: mockClient);
      expect(
        () => api.searchLocations('Amsterdam'),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains(AppStrings.unexpectedResponse),
          ),
        ),
      );
    });

    test('searchLocations throws on non-200 response', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Not found', 404, reasonPhrase: 'Not Found');
      });
      final api = ApiProvider(client: mockClient);
      expect(
        () => api.searchLocations('Amsterdam'),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains(AppStrings.failedToLoad),
          ),
        ),
      );
    });

    test('searchLocations throws on invalid JSON', () async {
      final mockClient = MockClient((request) async {
        return http.Response('not json', 200);
      });
      final api = ApiProvider(client: mockClient);
      expect(
        () => api.searchLocations('Amsterdam'),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains(AppStrings.failedToParse),
          ),
        ),
      );
    });
  });
}
