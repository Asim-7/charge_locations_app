import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

/// A row containing date and time pickers for selecting a charging appointment.
class ChargersDateTimePickerRow extends StatelessWidget {
  const ChargersDateTimePickerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Date Picker
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: AppTheme.chipBorder),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppTheme.iconSecondary,
                  size: 18,
                ),
                const SizedBox(width: 6),
                const Text('Thu, May 30', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 14),

        // Time Picker
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: AppTheme.chipBorder),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color: AppTheme.iconSecondary,
                  size: 18,
                ),
                const SizedBox(width: 6),
                const Text('16:30', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
