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
    final horizontalPadding = horizontalPagePadding;
    return const EdgeInsets.symmetric(
      vertical: 20,
    ).copyWith(
      left: horizontalPadding.left,
      right: horizontalPadding.right,
    );
  }

  static EdgeInsets get horizontalPagePadding {
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  static const double sliverAppBarScrolledUnderElevation = 0;

  static const double sliverAppBarTitleTwoLinesTextHeight = 164;
}
