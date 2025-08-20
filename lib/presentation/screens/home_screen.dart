import 'package:flutter/material.dart';
import '../widgets/home/home_bottom_nav_bar.dart';
import '../../data/providers/home_screens_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charge_locations_app/presentation/blocs/navigation/bottom_nav_cubit.dart';
import 'package:charge_locations_app/di/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final List<Widget> _screens = getHomeScreens();

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF4F6F8);
    const accentGreen = Color(0xFF6CF05A);

    return BlocProvider<BottomNavCubit>.value(
      value: diInstance<BottomNavCubit>(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            backgroundColor: bgColor,
            // using IndexedStack to preserve state
            body: IndexedStack(index: selectedIndex, children: _screens),
            bottomNavigationBar: HomeBottomNavBar(
              accentGreen: accentGreen,
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
