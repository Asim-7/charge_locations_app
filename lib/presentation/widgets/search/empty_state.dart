import 'package:flutter/material.dart';

/// Widget to display an empty state
class EmptyState extends StatelessWidget {
  final String message;
  const EmptyState({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        semanticsLabel: 'Prompt to search for charge locations',
      ),
    );
  }
}
