import 'package:charge_locations_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Returns the color for a connector status string.
Color getStatusColor(String status) {
  switch (status) {
    case 'AVAILABLE':
      return AppColors.statusAvailable;
    case 'CHARGING':
      return AppColors.searchError;
    default:
      return AppColors.searchIconSecondary;
  }
}
