import 'package:charge_locations_app/di/service_locator.dart';
import 'package:charge_locations_app/navigation/app_router.dart';
import 'package:charge_locations_app/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator(); // Initialize the service locator for dependency injection
  runApp(const ChargeLocationsApp());
}

class ChargeLocationsApp extends StatelessWidget {
  const ChargeLocationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charge Locations',
      theme: AppTheme.lightTheme, // Light theme
      darkTheme: AppTheme.darkTheme, // Dark theme
      themeMode: ThemeMode.system, // Auto switch based on device setting
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.searchScreenRoute,
    );
  }
}
