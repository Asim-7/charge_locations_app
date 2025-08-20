import 'package:flutter/material.dart';
import '../widgets/home/home_bottom_nav_bar.dart';
import 'package:charge_locations_app/theme/app_theme.dart';
import '../../data/providers/home_screens_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charge_locations_app/presentation/blocs/navigation/bottom_nav_cubit.dart';
import 'package:charge_locations_app/di/service_locator.dart';

/// Home screen displaying the main content and navigation.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final List<Widget> _screens = getHomeScreens();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavCubit>.value(
      value: diInstance<BottomNavCubit>(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            backgroundColor: AppTheme.backgroundColor,
            // using IndexedStack to preserve state
            body: IndexedStack(index: selectedIndex, children: _screens),
            bottomNavigationBar: HomeBottomNavBar(
              accentGreen: Theme.of(context).primaryColor,
              selectedIndex: selectedIndex,
              onItemTapped:
                  (index) =>
                      context.read<BottomNavCubit>().setSelectedIndex(index),
            ),
          );
        },
      ),
    );
  }
}
