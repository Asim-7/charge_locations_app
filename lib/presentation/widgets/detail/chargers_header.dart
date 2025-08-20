import 'package:flutter/material.dart';

/// A header widget for the chargers screen, displaying the title and subtitle.
class ChargersHeader extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final VoidCallback onBack;

  const ChargersHeader({
    super.key,
    required this.titleText,
    required this.subtitleText,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button overlay
        CircleAvatar(
          backgroundColor: Theme.of(context).cardColor,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: onBack,
          ),
        ),
        const SizedBox(height: 40),

        // Title and rating
        Text(
          titleText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),

        // Subtitle
        Text(
          subtitleText,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
