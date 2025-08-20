import 'dart:convert';
import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:http/http.dart' as http;

/// API provider for fetching charge locations and details
class ApiProvider {
  final http.Client client;
  static const String baseUrl = AppStrings.baseUrl;

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
          throw Exception(AppStrings.unexpectedResponse);
        }
      } catch (e) {
        throw Exception('${AppStrings.failedToParse}: $e');
      }
    } else {
      throw Exception(
        '${AppStrings.failedToLoad}: ${response.statusCode} ${response.reasonPhrase}',
      );
    }
  }

  // Add more API methods here as needed
}
