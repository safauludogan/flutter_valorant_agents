import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/themes/app_theme_colors.dart';
import 'package:flutter_valorant_agents/ui/themes/light/light_colors.dart';

class LightTheme {
  static final AppThemeColors colors = AppThemeColors(
      primary: LightColorPalette.greenPrimary,
      onPrimary: LightColorPalette.greenSecondary,
      secondary: LightColorPalette.greenPrimary,
      onSecondary: LightColorPalette.greenSecondary,
      surface: LightColorPalette.white,
      onSurface: LightColorPalette.black,
      error: LightColorPalette.red,
      onError: LightColorPalette.red,
      conditionalColor: LightColorPalette.greenPrimary);

  static ThemeData get themeData {
    return ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          secondary: colors.secondary,
          onSecondary: colors.onSecondary,
          surface: colors.surface,
          onSurface: colors.onSurface,
          error: colors.error,
          onError: colors.onError,
        ),
        scaffoldBackgroundColor:
            colors.surface, // Set scaffold background to match surface
        extensions: <ThemeExtension<AppThemeColors>>[colors]);
  }
}
