import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  final Color accentGreen;
  final void Function(int) onItemTapped;
  const HomeBottomNavBar({
    required this.accentGreen,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.home_rounded, color: accentGreen, size: 28),
            onPressed: () => onItemTapped(0),
          ),
          IconButton(
            icon: const Icon(
              Icons.ev_station_outlined,
              color: Colors.grey,
              size: 28,
            ),
            onPressed: () => onItemTapped(1),
          ),
          IconButton(
            icon: const Icon(Icons.map_outlined, color: Colors.grey, size: 28),
            onPressed: () => onItemTapped(2),
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: 28,
            ),
            onPressed: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
