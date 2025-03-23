import 'package:flutter/material.dart';

abstract class CustomTheme {
  ThemeData get themeData;

  ElevatedButtonThemeData get elevatedButtonThemeData;
  InputDecorationTheme get inputDecorationTheme;
  AppBarTheme get appBarTheme;
  TextTheme? get textTheme;
  TabBarThemeData get tabBarTheme;
}
