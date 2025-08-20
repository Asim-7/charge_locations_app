import 'package:flutter/material.dart';
import 'package:charge_locations_app/theme/app_theme.dart';

/// A row displaying the rating and review count for a charging station.
class ChargersRatingRow extends StatelessWidget {
  const ChargersRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rating Icon
        const Icon(Icons.star, color: AppTheme.star, size: 17),
        const SizedBox(width: 2),

        // Rating Text
        const Text(
          '4.5',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),

        // Review Count
        const Text(
          ' (56 Reviews)',
          style: TextStyle(color: AppTheme.subtitleColor),
        ),
        const Spacer(),

        // Sync Button
        Container(
          decoration: BoxDecoration(
            color: AppTheme.iconButtonBg,
            borderRadius: BorderRadius.circular(13),
          ),
          child: IconButton(
            icon: const Icon(Icons.sync_alt, color: AppTheme.icon),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 6),

        // Favorite Button
        Container(
          decoration: BoxDecoration(
            color: AppTheme.iconButtonBg,
            borderRadius: BorderRadius.circular(13),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: AppTheme.favoriteBorder,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
