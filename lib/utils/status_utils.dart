import 'package:flutter/material.dart';

/// Returns the color for a connector status string.
Color getStatusColor(BuildContext context, String status) {
  switch (status) {
    case 'AVAILABLE':
      return Theme.of(context).colorScheme.onInverseSurface;
    case 'CHARGING':
      return Theme.of(context).colorScheme.inverseSurface;
    default:
      return Theme.of(context).colorScheme.onSurface;
  }
}
