import 'package:flutter/material.dart';

class CarInfoHeader extends StatelessWidget {
  final String carModel;
  final String carBrand;
  final int notificationCount;
  final Color accentGreen;
  const CarInfoHeader({
    required this.carModel,
    required this.carBrand,
    required this.notificationCount,
    required this.accentGreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              carModel,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              carBrand,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 28,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            if (notificationCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: accentGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
