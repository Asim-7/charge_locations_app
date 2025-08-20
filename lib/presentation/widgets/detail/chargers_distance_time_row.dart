import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

/// A row displaying the distance and time estimates for reaching the charging station.
class ChargersDistanceTimeRow extends StatelessWidget {
  const ChargersDistanceTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Distance
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.searchCard,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text('1.8 km', style: TextStyle(fontSize: 13)),
        ),
        const SizedBox(width: 6),

        // Time
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.searchCard,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text('3 min', style: TextStyle(fontSize: 13)),
        ),
      ],
    );
  }
}
