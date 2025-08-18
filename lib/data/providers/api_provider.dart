import 'dart:convert';
import 'package:http/http.dart' as http;

/// API provider for fetching charge locations and details
class ApiProvider {
  static const String baseUrl =
      'https://app-assignment-api-test.azurewebsites.net';

  Future<List> searchLocations(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Locations?city=$city'),
      // using header so request don't fail due to missing header or something
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data as List;
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
