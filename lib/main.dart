import 'package:flutter/material.dart';
import 'presentation/screens/search_screen.dart';
import 'presentation/blocs/search/search_bloc.dart';
import 'data/repositories/charge_location_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
      home: BlocProvider(
        create:
            (_) => LocationSearchBloc(repository: ChargeLocationRepository()),
        child: const SearchScreen(),
      ),
    );
  }
}
