import 'package:charge_locations_app/di/service_locator.dart';
import 'package:charge_locations_app/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/blocs/search/search_bloc.dart';

void main() {
  setupLocator();
  runApp(const ChargeLocationsApp());
}

class ChargeLocationsApp extends StatelessWidget {
  const ChargeLocationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => diInstance<LocationSearchBloc>()),
        // Add more BlocProviders here as the app grows
      ],
      child: MaterialApp(
        title: 'Charge Locations',
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: searchScreenRoute,
      ),
    );
  }
}
