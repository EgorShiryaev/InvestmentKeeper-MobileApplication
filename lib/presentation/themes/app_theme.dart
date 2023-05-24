import 'package:flutter/material.dart';

import 'custom_text_theme.dart';
import 'light_color_scheme.dart';

class AppTheme {
  static ThemeData _baseTheme({required ColorScheme colorScheme}) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      textTheme: const CustomTextTheme(),
      colorScheme: colorScheme,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
      ),
    );
  }

  static ThemeData get light {
    const colorScheme = LightColorScheme();

    return _baseTheme(colorScheme: colorScheme);
  }

  static EdgeInsets get pagePadding {
    return const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 16,
    );
  }

  static double get sliverAppBarScrolledUnderElevation => 0;

  static double get sliverAppBarTitleTwoLinesTextHeight => 164;
}
