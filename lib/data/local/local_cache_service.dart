import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for local caching of search data
class LocalCacheService {
  static const String lastCityKey = 'last_city';
  static const String lastCityDataKey = 'last_city_data';

  /// Saves the last searched city and its data
  Future<void> saveLastSearch(String city, List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(lastCityKey, city);
    await prefs.setString(lastCityDataKey, jsonEncode(data));
  }

  /// Retrieves the last searched city and its data
  Future<Map<String, dynamic>?> getLastSearch() async {
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString(lastCityKey);
    final dataString = prefs.getString(lastCityDataKey);
    if (city != null && dataString != null) {
      final data = jsonDecode(dataString);
      return {'city': city, 'data': data};
    }
    return null;
  }
}
