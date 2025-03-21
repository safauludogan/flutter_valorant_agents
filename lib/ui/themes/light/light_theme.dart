import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/ui/styles/radiuses.dart';
import 'package:flutter_valorant_agents/ui/styles/text_styles.dart';
import 'package:flutter_valorant_agents/ui/themes/app_theme_colors.dart';
import 'package:flutter_valorant_agents/ui/themes/base/custom_theme.dart';
import 'package:flutter_valorant_agents/ui/themes/light/light_colors.dart';
import 'package:gen/gen.dart';

class LightTheme implements CustomTheme {
  LightTheme._();
  static final LightTheme _instance = LightTheme._();
  static LightTheme get instance => _instance;

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

  @override
  ThemeData get themeData {
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
        elevatedButtonTheme: elevatedButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        scaffoldBackgroundColor:
            colors.surface, // Set scaffold background to match surface
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
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        hintStyle: AppTextStyles.small.copyWith(
          fontSize: 14,
          color: ColorName.gray500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidgetSizes.spacingSs),
          borderSide: const BorderSide(color: ColorName.gray200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidgetSizes.spacingSs),
          borderSide: const BorderSide(color: ColorName.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidgetSizes.spacingSs),
          borderSide: const BorderSide(color: ColorName.gray200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidgetSizes.spacingSs),
          borderSide: const BorderSide(color: ColorName.gray200),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(WidgetSizes.spacingSs),
          borderSide: const BorderSide(color: ColorName.gray200),
        ),
        filled: true,
        isDense: true,
        fillColor: ColorName.gray100,
      );
}
