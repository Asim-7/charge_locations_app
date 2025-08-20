import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

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
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppTheme.cardShadow,
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
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
