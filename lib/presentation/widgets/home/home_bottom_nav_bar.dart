import 'package:flutter/material.dart';
import 'package:charge_locations_app/data/models/nav_bar_item.dart';

/// A widget that displays the bottom navigation bar.
class HomeBottomNavBar extends StatelessWidget {
  final Color accentGreen;
  final int selectedIndex;
  final void Function(int) onItemTapped;
  const HomeBottomNavBar({
    super.key,
    required this.accentGreen,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      NavBarItem(icon: Icons.home_rounded, index: 0),
      NavBarItem(icon: Icons.ev_station_outlined, index: 1),
      NavBarItem(icon: Icons.map_outlined, index: 2),
      NavBarItem(icon: Icons.person_outline, index: 3),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            items
                .map(
                  (item) => IconButton(
                    icon: Icon(
                      item.icon,
                      color:
                          selectedIndex == item.index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    onPressed: () => onItemTapped(item.index),
                  ),
                )
                .toList(),
      ),
    );
  }
}
