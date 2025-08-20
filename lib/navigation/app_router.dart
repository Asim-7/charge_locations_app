import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/presentation/screens/chargers_screen.dart';
import 'package:charge_locations_app/presentation/widgets/router/no_route.dart';
import 'package:flutter/material.dart';

/// AppRouter class to handle navigation
class AppRouter {
  static const String detailScreenRoute = '/detailScreenRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Route for the detail screen
      case detailScreenRoute:
        final location = settings.arguments as ChargeLocation;
        return MaterialPageRoute(
          builder: (_) => ChargersScreen(location: location),
        );

      // Add more routes here
      default:
        return MaterialPageRoute(builder: (_) => NoRoute(name: settings.name));
    }
  }
}
