import 'package:flutter/material.dart';

class CustomTextTheme extends TextTheme {
  const CustomTextTheme()
      : super(
          displayLarge: const TextStyle(
            fontSize: 57,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: const TextStyle(
            fontSize: 45,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          displaySmall: const TextStyle(
            fontSize: 36,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          headlineLarge: const TextStyle(
            fontSize: 32,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: const TextStyle(
            fontSize: 28,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: const TextStyle(
            fontSize: 24,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: const TextStyle(
            fontSize: 22,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: const TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: const TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: const TextStyle(
            fontSize: 12,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: const TextStyle(
            fontSize: 11,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            letterSpacing: 0.25,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: const TextStyle(
            fontSize: 12,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w400,
          ),
        );
}
