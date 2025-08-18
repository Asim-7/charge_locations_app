import 'package:charge_locations_app/presentation/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

/// AppRouter class to handle navigation
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      // Add more routes here
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
