import 'package:eco_ideas/theme/constants.dart';
import 'package:eco_ideas/theme/input_decoration_theme.dart';
import 'package:flutter/material.dart';

class EcoIdeasTheme {
  EcoIdeasTheme._();
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
    ),
    inputDecorationTheme: EcoIdeasInputDecorationTheme.theme,
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: primaryColor,
    ),
    inputDecorationTheme: EcoIdeasInputDecorationTheme.theme,
  );
}
