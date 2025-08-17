import 'package:flutter/material.dart';

/// Widget to display an empty state
class EmptyState extends StatelessWidget {
  const EmptyState({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search for charge locations.',
        semanticsLabel: 'Prompt to search for charge locations',
      ),
    );
  }
}
