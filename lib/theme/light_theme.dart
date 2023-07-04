import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      color: Colors.white,
      fontFamily: 'Gilroy',
      fontSize: 36,
      letterSpacing: 0.42,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: const TextStyle(
      color: Colors.black,
      fontFamily: 'Gilroy',
      fontSize: 28,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: const TextStyle(
      color: Colors.white,
      fontFamily: 'Gilroy',
      fontSize: 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontFamily: 'Gilroy',
      fontSize: 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontFamily: 'Gilroy',
      fontSize: 10,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: const TextStyle(
      color: Colors.white,
      fontFamily: 'Gilroy',
      fontSize: 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: const TextStyle(
      color: Colors.white,
      fontFamily: 'Gilroy',
      fontSize: 18,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ), // Button text design
    displaySmall: const TextStyle(
      color: Colors.white,
      fontFamily: 'Gilroy',
      fontSize: 17,
      letterSpacing: -0.41,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: const TextStyle(
      color: Colors.white,
      fontFamily: 'Gilroy',
      fontSize: 24,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ), // Button,,
    bodyMedium: const TextStyle(
      color: Colors.black,
      fontFamily: 'Gilroy',
      fontSize: 18,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ), // Button,
    bodySmall: TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontFamily: 'Gilroy',
      fontSize: 8,
      fontWeight: FontWeight.w500,
    ),
  ),
);
