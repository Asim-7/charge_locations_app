import 'package:flutter/material.dart';

class AppTheme {
  // Search widgets
  static const Color searchCard = Colors.white;
  static const Color searchCardBorder = Color(
    0xFFE0E0E0,
  ); // Colors.grey.shade300
  static const Color searchCardShadow = Color(
    0xFFF5F5F5,
  ); // Colors.grey.shade200
  static const Color searchIcon = Colors.black;
  static const Color searchIconSecondary = Colors.grey;
  static const Color searchIconAccent = accentGreen;
  static const Color searchTextPrimary = Colors.black;
  static const Color searchTextSecondary = Colors.grey;
  static const Color searchError = Colors.red;
  static const Color searchAvailable = accentGreen;
  static const Color searchUnavailable = Colors.red;
  static const Color searchIconBg = Color(0xFFE8F5E9);
  static const Color searchDivider = searchCardBorder;
  static const Color searchListShadow = searchCardShadow;
  static const Color searchListAvailableBg = Color(
    0x216CF05A,
  ); // accentGreen with 13% alpha
  static const Color searchListUnavailableBg = Color(
    0x21FF0000,
  ); // red with 13% alpha
  // Home widgets
  static const Color cardBackground = Colors.white;
  static const Color cardBorder = Color(0xFFE0E0E0); // Colors.grey.shade300
  static const Color cardShadow = Color(0xFFF5F5F5); // Colors.grey.shade200
  static const Color iconBg = Color(0xFFE8F5E9);
  static const Color icon = Colors.black;
  static const Color iconAccent = accentGreen;
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.grey;
  static const Color buttonPrimary = Colors.black;
  static const Color buttonText = Colors.white;
  static const Color navBarBg = cardBackground;
  static const Color navBarSelected = accentGreen;
  static const Color navBarUnselected = textSecondary;
  static const Color routeLine = accentGreen;
  static const Color routeStart = accentGreen;
  static const Color routeEnd = statusAvailable;
  static const Color statusAvailable = Colors.green;
  static const Color statusCharging = Colors.red;
  static const Color statusDefault = Colors.grey;
  static const Color border = Color(0xFFE0E0E0); // Colors.grey.shade300
  static const Color trailingIcon = Colors.grey;
  static const Color accentGreen = Color(0xFF6CF05A);
  static const Color subtitleColor = Colors.grey;
  static const Color backgroundColor = Color(0xFFF4F6F8);
  static const Color gradientStart = Color(0xFFE0F7FA); // Light cyan
  static const Color gradientEnd = Color(0x00E0F7FA); // Transparent fade

  // Unified color references
  static const Color chipBackground = cardBackground;
  static const Color iconButtonBg = Color(0xFFF5F5F5); // Colors.grey.shade200
  static const Color chipBorder = Color(0xFFE0E0E0); // Colors.grey.shade300
  static const Color star = Colors.amber;
  static const Color iconSecondary = Colors.black54;
  static const Color favoriteBorder = icon;
}
