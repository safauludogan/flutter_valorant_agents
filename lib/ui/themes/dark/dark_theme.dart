import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/styles/radiuses.dart';
import 'package:flutter_valorant_agents/ui/themes/app_theme_colors.dart';
import 'package:flutter_valorant_agents/ui/themes/base/custom_theme.dart';
import 'package:flutter_valorant_agents/ui/themes/dark/dark_colors.dart';
import 'package:gen/gen.dart';

class DarkTheme implements CustomTheme {
  DarkTheme._();
  static final DarkTheme _instance = DarkTheme._();
  static DarkTheme get instance => _instance;

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

  ThemeData get themeData {
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
        elevatedButtonTheme: elevatedButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        scaffoldBackgroundColor: colors.surface,
        appBarTheme: appBarTheme,
        extensions: <ThemeExtension<AppThemeColors>>[colors]);
  }

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorName.primary300,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: Radiuses.b8r,
          ),
          foregroundColor: ColorName.white,
          textStyle: const TextStyle(
            color: ColorName.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  @override
  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme(
        hintStyle: TextStyle(color: ColorName.gray500),
      );

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        elevation: 1,
        shadowColor: ColorName.gray200,
        backgroundColor: ColorName.white,
        surfaceTintColor: ColorName.white,
        centerTitle: false,
      );
}
