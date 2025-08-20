import 'package:charge_locations_app/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// Widget to display an error message with a retry button
class ErrorRetry extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const ErrorRetry({required this.message, required this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
            semanticsLabel: 'Error message',
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text(AppStrings.retry, semanticsLabel: 'Retry search'),
          ),
        ],
      ),
    );
  }
}
