import 'package:charge_locations_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// A row displaying the rating and review count for a charging station.
class ChargersRatingRow extends StatelessWidget {
  const ChargersRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rating Icon
        const Icon(Icons.star, color: AppColors.star, size: 17),
        const SizedBox(width: 2),

        // Rating Text
        const Text(
          '4.5',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),

        // Review Count
        Text(
          ' (56 Reviews)',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        const Spacer(),

        // Sync Button
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.shadow,
            borderRadius: BorderRadius.circular(13),
          ),
          child: IconButton(
            icon: Icon(
              Icons.sync_alt,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 6),

        // Favorite Button
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.shadow,
            borderRadius: BorderRadius.circular(13),
          ),
          child: IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
