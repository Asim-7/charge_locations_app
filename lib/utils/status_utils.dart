import 'package:charge_locations_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Returns the color for a connector status string.
Color getStatusColor(String status) {
  switch (status) {
    case 'AVAILABLE':
      return AppTheme.statusAvailable;
    case 'CHARGING':
      return AppTheme.searchError;
    default:
      return AppTheme.searchIconSecondary;
  }
}
