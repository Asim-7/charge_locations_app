import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

/// A widget that displays the distance and energy information.
class DistanceEnergyRow extends StatelessWidget {
  final int distanceKm;
  final String timeLeft;
  final double energyKwh;
  const DistanceEnergyRow({
    required this.distanceKm,
    required this.timeLeft,
    required this.energyKwh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Distance information
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Distance label
                Text(
                  AppStrings.distance,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                  ),
                ),

                // Distance value
                Text(
                  '$distanceKm km',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),

                // Distance time left
                Text(
                  timeLeft,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Energy information
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Energy label
                const Text(
                  AppStrings.energy,
                  style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
                ),

                // Energy value
                Text(
                  '$energyKwh kwh',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),

                // Energy time left
                Text(
                  AppStrings.singleBattery,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
