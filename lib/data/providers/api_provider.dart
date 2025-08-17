import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  static const String baseUrl =
      'https://app-assignment-api-test.azurewebsites.net';

  Future<List> searchLocations(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Locations?city=$city'),
      // using header so request don't fail due to missing header or something
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'Mozilla/5.0', // Mimic a browser
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data as List;
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Future<Map<String, dynamic>> getLocationDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/Location/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load location detail');
    }
  }
}
