import 'package:flutter/material.dart';

class EcoIdeasTheme {
  static ThemeData get light => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      );

  static ThemeData get dark => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      );
}
