import 'package:flutter/material.dart';

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
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).colorScheme.onPrimaryFixed,
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
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Theme.of(context).colorScheme.onPrimaryFixed,
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
