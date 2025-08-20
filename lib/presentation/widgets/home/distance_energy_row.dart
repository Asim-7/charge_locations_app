import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:flutter/material.dart';

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
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Distance label
                Text(
                  AppStrings.distance,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                // Distance value
                Text(
                  '$distanceKm km',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),

                // Distance time left
                Text(
                  timeLeft,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.secondary,
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
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Energy label
                Text(
                  AppStrings.energy,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),

                // Energy value
                Text(
                  '$energyKwh kwh',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),

                // Energy time left
                Text(
                  AppStrings.singleBattery,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.secondary,
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
