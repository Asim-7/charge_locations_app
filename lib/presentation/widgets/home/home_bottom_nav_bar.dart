import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  final Color accentGreen;
  const HomeBottomNavBar({required this.accentGreen, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home_rounded, color: accentGreen, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.ev_station_outlined,
              color: Colors.grey,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.map_outlined, color: Colors.grey, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
