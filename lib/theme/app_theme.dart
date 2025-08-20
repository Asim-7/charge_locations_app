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
  static const Color accentGreen = Color(0xFF6CF05A);
  static const Color searchTextPrimary = searchIcon;
  static const Color searchTextSecondary = searchIconSecondary;
  static const Color searchError = Colors.red;
  static const Color searchIconBg = Color(0xFFE8F5E9);
  static const Color searchListAvailableBg = Color(
    0x216CF05A,
  ); // accentGreen with 13% alpha
  static const Color searchListUnavailableBg = Color(
    0x21FF0000,
  ); // red with 13% alpha
  // Home widgets
  static const Color statusAvailable = Colors.green;
  static const Color backgroundColor = Color(0xFFF4F6F8);
  static const Color gradientStart = Color(0xFFE0F7FA); // Light cyan
  static const Color gradientEnd = Color(0x00E0F7FA); // Transparent fade

  // Unified color references
  static const Color star = Colors.amber;
  static const Color iconSecondary = Colors.black54;
  static const Color favoriteBorder = searchIcon;
}
