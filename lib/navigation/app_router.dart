import 'package:charge_locations_app/data/models/charge_location.dart';
import 'package:charge_locations_app/di/service_locator.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_bloc.dart';
import 'package:charge_locations_app/presentation/screens/detail/detail_screen.dart';
import 'package:charge_locations_app/presentation/screens/search/search_screen.dart';
import 'package:charge_locations_app/presentation/widgets/router/no_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// AppRouter class to handle navigation
class AppRouter {
  static const String searchScreenRoute = '/';
  static const String detailScreenRoute = '/detailScreenRoute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// Route for the search screen with its BlocProvider
      case searchScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => diInstance<LocationSearchBloc>(),
                child: const SearchScreen(),
              ),
        );

      // Route for the detail screen
      case detailScreenRoute:
        final location = settings.arguments as ChargeLocation;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(location: location),
        );

      // Add more routes here
      default:
        return MaterialPageRoute(builder: (_) => NoRoute(name: settings.name));
    }
  }
}
