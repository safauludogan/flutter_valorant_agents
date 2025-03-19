import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/themes/app_theme_colors.dart';
import 'package:flutter_valorant_agents/ui/themes/dark/dark_colors.dart';

class DarkTheme {
  static final AppThemeColors colors = AppThemeColors(
    primary: DarkColorPalette.greenPrimary,
    onPrimary: DarkColorPalette.white,
    secondary: DarkColorPalette.greenSecondary,
    onSecondary: DarkColorPalette.white,
    surface: DarkColorPalette.black,
    onSurface: DarkColorPalette.black,
    error: DarkColorPalette.red,
    onError: DarkColorPalette.white,
    conditionalColor: Colors.black,
  );

  static ThemeData get themeData {
    return ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          secondary: colors.secondary,
          onSecondary: colors.onSecondary,
          surface: colors.surface,
          onSurface: colors.onSurface,
          error: colors.error,
          onError: colors.onError,
        ),
        scaffoldBackgroundColor: colors.surface,
        extensions: <ThemeExtension<AppThemeColors>>[colors]);
  }
}
