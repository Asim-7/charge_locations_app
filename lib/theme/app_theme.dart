import 'package:flutter/material.dart';

class AppTheme {
  // Light mode colors
  static const Color searchCard = Colors.white;
  static const Color searchCardBorder = Color(0xFFE0E0E0);
  static const Color searchCardShadow = Color(0xFFF5F5F5);
  static const Color searchIcon = Colors.black;
  static const Color searchIconSecondary = Colors.grey;
  static const Color accentGreen = Color(0xFF6CF05A);
  static const Color searchError = Colors.red;
  static const Color searchIconBg = Color(0xFFE8F5E9);
  static const Color searchListAvailableBg = Color(0x216CF05A);
  static const Color searchListUnavailableBg = Color(0x21FF0000);
  static const Color statusAvailable = Colors.green;
  static const Color backgroundColor = Color(0xFFF4F6F8);
  static const Color gradientStart = Color(0xFFE0F7FA); // Light cyan
  static const Color gradientEnd = Color(0x00E0F7FA); // Transparent fade
  static const Color star = Colors.amber;
  static const Color iconSecondary = Colors.black54;

  // Dark mode colors (derived to match accents and structure)
  static const Color darkSearchCard = Color(0xFF232429);
  static const Color darkSearchCardBorder = Color(0xFF3A3B3F);
  static const Color darkSearchCardShadow = Color(0xFF121212);
  static const Color darkSearchIcon = Colors.white;
  static const Color darkSearchIconSecondary = Colors.grey;
  static const Color darkAccentGreen = accentGreen;
  static const Color darkSearchError = Colors.redAccent;
  static const Color darkSearchIconBg = Color(0xFF263238);
  static const Color darkSearchListAvailableBg = Color(0x216CF05A);
  static const Color darkSearchListUnavailableBg = Color(0x21FF0000);
  static const Color darkStatusAvailable = Colors.greenAccent;
  static const Color darkBackgroundColor = Color(0xFF18191A);
  static const Color darkGradientStart = Color(0xFF263238); // Darker cyan
  static const Color darkGradientEnd = Color(0x00263238); // Transparent fade
  static const Color darkStar = Colors.amber;
  static const Color darkIconSecondary = Colors.white70;

  // Light ThemeData
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: accentGreen,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: accentGreen,
      onPrimary: searchIcon,
      onPrimaryContainer: searchIconBg,
      onPrimaryFixed: iconSecondary,
      secondary: searchIconSecondary,
      onSecondary: searchIcon,
      error: searchError,
      onError: searchIcon,
      surface: backgroundColor,
      onSurface: searchIcon,
      tertiary: statusAvailable,
      onTertiary: searchIcon,
      outline: searchCardBorder,
      outlineVariant: searchCardShadow,
      shadow: searchCardShadow,
      inverseSurface: searchListUnavailableBg,
      onInverseSurface: searchListAvailableBg,
      scrim: gradientStart,
      surfaceTint: gradientEnd,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: accentGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: searchCard,
    dividerColor: searchCardBorder,
    iconTheme: const IconThemeData(color: searchIcon, size: 24),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: searchIcon),
      bodyMedium: TextStyle(fontSize: 14, color: searchIconSecondary),
      titleLarge: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: searchIcon,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: searchIcon,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: searchCard,
      disabledColor: searchCard,
      selectedColor: accentGreen.withValues(alpha: 0.15),
      secondarySelectedColor: accentGreen,
      labelStyle: const TextStyle(color: searchIcon),
      secondaryLabelStyle: const TextStyle(color: searchIcon),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: searchIcon,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    ),
    shadowColor: searchCardShadow,
    highlightColor: gradientStart,
    splashColor: gradientEnd,
  );

  // Dark ThemeData
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackgroundColor,
    primaryColor: darkAccentGreen,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: darkAccentGreen,
      onPrimary: darkSearchIcon,
      onPrimaryContainer: darkSearchIconBg,
      onPrimaryFixed: darkIconSecondary,
      secondary: darkSearchIconSecondary,
      onSecondary: darkSearchIcon,
      error: darkSearchError,
      onError: darkSearchIcon,
      surface: darkBackgroundColor,
      onSurface: darkSearchIcon,
      tertiary: darkStatusAvailable,
      onTertiary: darkSearchIcon,
      outline: darkSearchCardBorder,
      outlineVariant: darkSearchCardShadow,
      shadow: darkSearchCardShadow,
      inverseSurface: darkSearchListUnavailableBg,
      onInverseSurface: darkSearchListAvailableBg,
      scrim: darkGradientStart,
      surfaceTint: darkGradientEnd,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkAccentGreen,
      foregroundColor: Colors.black,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: darkSearchCard,
    dividerColor: darkSearchCardBorder,
    iconTheme: const IconThemeData(color: darkSearchIcon, size: 24),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: darkSearchIcon),
      bodyMedium: TextStyle(fontSize: 14, color: darkSearchIconSecondary),
      titleLarge: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: darkSearchIcon,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: darkSearchIcon,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: darkSearchCard,
      disabledColor: darkSearchCard,
      selectedColor: darkAccentGreen.withValues(alpha: 0.15),
      secondarySelectedColor: darkAccentGreen,
      labelStyle: const TextStyle(color: darkSearchIcon),
      secondaryLabelStyle: const TextStyle(color: darkSearchIcon),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: darkSearchIcon,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    ),
    shadowColor: darkSearchCardShadow,
    highlightColor: darkGradientStart,
    splashColor: darkGradientEnd,
  );
}
