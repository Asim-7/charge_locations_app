import 'package:flutter/material.dart';

/// Returns the color for a connector status string.
Color getStatusColor(BuildContext context, String status) {
  switch (status) {
    case 'AVAILABLE':
      return ThemeData().colorScheme.tertiary;
    case 'CHARGING':
      return ThemeData().colorScheme.error;
    default:
      return ThemeData().colorScheme.onSurface;
  }
}
