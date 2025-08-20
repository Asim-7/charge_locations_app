import 'package:flutter/material.dart';

/// A widget that displays the battery level of the car.
class BatteryWidget extends StatelessWidget {
  final int batteryPercent;
  final Color accentGreen;
  const BatteryWidget({
    required this.batteryPercent,
    required this.accentGreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Theme.of(context).colorScheme.shadow,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Battery icon
          Icon(Icons.battery_4_bar_rounded, color: accentGreen, size: 70),
          const SizedBox(height: 8),

          // Battery percentage text
          Text(
            '$batteryPercent%',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
