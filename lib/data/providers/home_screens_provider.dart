import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charge_locations_app/presentation/screens/main_content_screen.dart';
import 'package:charge_locations_app/presentation/screens/search_screen.dart';
import 'package:charge_locations_app/presentation/blocs/search/search_bloc.dart';
import 'package:charge_locations_app/di/service_locator.dart';

/// Provides the list of screens for the HomeScreen's bottom navigation.
List<Widget> getHomeScreens() => <Widget>[
  const MainContentScreen(),
  BlocProvider(
    create: (_) => diInstance<LocationSearchBloc>(),
    child: const SearchScreen(),
  ),
  const Center(child: Text('📍 Map Screen', style: TextStyle(fontSize: 24))),
  // const ChargersScreen(),
  const Center(
    child: Text('👤 Profile Screen', style: TextStyle(fontSize: 24)),
  ),
];
