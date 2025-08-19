import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charge_locations_app/presentation/bloc/bottom_nav_cubit.dart';

class HomeBottomNavBar extends StatelessWidget {
  final Color accentGreen;
  final void Function(int) onItemTapped;
  const HomeBottomNavBar({
    super.key,
    required this.accentGreen,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_rounded,
                  color: selectedIndex == 0 ? accentGreen : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemTapped(0),
              ),
              IconButton(
                icon: Icon(
                  Icons.ev_station_outlined,
                  color: selectedIndex == 1 ? accentGreen : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemTapped(1),
              ),
              IconButton(
                icon: Icon(
                  Icons.map_outlined,
                  color: selectedIndex == 2 ? accentGreen : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemTapped(2),
              ),
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: selectedIndex == 3 ? accentGreen : Colors.grey,
                  size: 28,
                ),
                onPressed: () => onItemTapped(3),
              ),
            ],
          ),
        );
      },
    );
  }
}
