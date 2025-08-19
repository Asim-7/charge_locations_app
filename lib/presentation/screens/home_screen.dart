import 'package:flutter/material.dart';
import '../widgets/home/home_bottom_nav_bar.dart';
import 'main_content_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charge_locations_app/presentation/bloc/bottom_nav_cubit.dart';
import 'package:charge_locations_app/di/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Widget> _screens = <Widget>[
    MainContentScreen(),
    Center(child: Text('🔍 Search Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('👤 Profile Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('⚙️ Settings Screen', style: TextStyle(fontSize: 24))),
  ];

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
            body: _screens[selectedIndex],
            bottomNavigationBar: HomeBottomNavBar(
              accentGreen: accentGreen,
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
