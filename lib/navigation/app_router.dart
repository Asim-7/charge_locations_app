import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/presentation/screens/detail/detail_screen.dart';
import 'package:charge_locations_app/presentation/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

/// AppRouter class to handle navigation
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case searchScreenRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case detailScreenRoute:
        final location = settings.arguments as ChargeLocation;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(location: location),
        );
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

const String searchScreenRoute = '/';
const String detailScreenRoute = '/detailScreenRoute';
