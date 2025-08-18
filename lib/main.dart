import 'package:charge_locations_app/di/service_locator.dart';
import 'package:charge_locations_app/navigation/app_router.dart';
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
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: searchScreenRoute,
    );
  }
}
