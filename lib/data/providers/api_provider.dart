import 'dart:convert';
import 'package:http/http.dart' as http;

/// API provider for fetching charge locations and details
class ApiProvider {
  final http.Client client;
  static const String baseUrl =
      'https://app-assignment-api-test.azurewebsites.net';

  ApiProvider({http.Client? client}) : client = client ?? http.Client();

  Future<List<dynamic>> searchLocations(String city) async {
    final uri = Uri.parse('$baseUrl/Locations?city=$city');
    final response = await client.get(
      uri,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        if (data is List) {
          return data;
        } else {
          throw Exception('Unexpected response format');
        }
      } catch (e) {
        throw Exception('Failed to parse locations: $e');
      }
    } else {
      throw Exception(
        'Failed to load locations: ${response.statusCode} ${response.reasonPhrase}',
      );
    }
  }

  // Add more API methods here as needed
}
