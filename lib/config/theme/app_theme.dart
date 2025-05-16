import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: 'Quicksand',
    brightness: Brightness.light,
    textTheme: _textTheme,
    cardTheme: _cardTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static TextTheme get _textTheme => const TextTheme(
    labelSmall: TextStyle(fontSize: kSize12, fontWeight: FontWeight.normal),
    labelMedium: TextStyle(fontSize: kSize14, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: kSize16, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(fontSize: kSize18, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: kSize20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: kSize24, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: kSize30, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: kSize34, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(fontSize: kSize40, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(fontSize: kSize12, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: kSize14, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(fontSize: kSize16, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(fontSize: kSize20, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: kSize24, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: kSize28, fontWeight: FontWeight.bold),
  );

  static CardTheme get _cardTheme => CardTheme(color: kWhite, elevation: kNone, margin: EdgeInsets.zero);

  static InputDecorationTheme get _inputDecorationTheme => const InputDecorationTheme(
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: kSize10),
  );
}
