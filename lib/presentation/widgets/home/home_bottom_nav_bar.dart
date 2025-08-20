import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

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
      _NavBarItem(icon: Icons.home_rounded, index: 0),
      _NavBarItem(icon: Icons.ev_station_outlined, index: 1),
      _NavBarItem(icon: Icons.map_outlined, index: 2),
      _NavBarItem(icon: Icons.person_outline, index: 3),
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.navBarBg,
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
                              ? AppTheme.navBarSelected
                              : AppTheme.navBarUnselected,
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

class _NavBarItem {
  final IconData icon;
  final int index;
  const _NavBarItem({required this.icon, required this.index});
}
