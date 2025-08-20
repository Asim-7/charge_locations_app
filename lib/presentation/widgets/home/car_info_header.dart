import 'package:flutter/material.dart';

/// A header widget that displays the car's information.
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
        // A column displaying the car model and brand.
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The car model text.
            Text(
              carModel,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),

            // The car brand text.
            Text(
              carBrand,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),

        // A stack displaying the notification icon and count.
        Stack(
          children: [
            // Notification icon button
            IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 28,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {},
            ),

            // Notification badge
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
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
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
