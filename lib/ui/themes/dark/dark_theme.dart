import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
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
    primary: ColorName.primary,
    onPrimary: ColorName.primary400,
    secondary: DarkColorPalette.greenSecondary,
    onSecondary: DarkColorPalette.white,
    surface: DarkColorPalette.black,
    onSurface: ColorName.white,
    error: DarkColorPalette.red,
    onError: DarkColorPalette.white,
    surfaceTint: ColorName.gray900,
    conditionalColor: Colors.black,
  );

  @override
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
          surfaceTint: colors.surfaceTint,
        ),
        textTheme: textTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        scaffoldBackgroundColor: colors.surface,
        appBarTheme: appBarTheme,
        tabBarTheme: tabBarTheme,
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
        hintStyle: textTheme?.labelMedium?.copyWith(color: ColorName.gray500),
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

  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        elevation: 1,
        shadowColor: ColorName.gray200,
        backgroundColor: ColorName.black,
        surfaceTintColor: ColorName.white,
        centerTitle: false,
      );

  @override
  TextTheme? get textTheme => TextTheme(
        // Display styles
        displayLarge: TextStyle(
          //
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: colors.onSecondary,
        ),
        displayMedium: TextStyle(
          //
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
          color: colors.onSecondary,
        ),
        displaySmall: TextStyle(
          // headline3
          fontSize: 30.sp,
          fontWeight: FontWeight.normal,
          color: colors.onSecondary,
        ),

        // Body styles
        bodyLarge: TextStyle(
          //bodyText1
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: colors.onSecondary,
        ),
        bodyMedium: TextStyle(
          //bodyText2
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: colors.onSecondary,
        ),
        bodySmall: TextStyle(
          //bodyText3
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: colors.onSecondary,
        ),

        // Label styles
        labelLarge: TextStyle(
          //footNote1
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: colors.onSecondary,
        ),
        labelMedium: TextStyle(
          //footNote2
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: colors.onSecondary,
        ),
        labelSmall: TextStyle(
          //footNote3
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: colors.onSecondary,
        ),

        // Title styles
        titleLarge: TextStyle(
          //footNote1
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: colors.onSecondary,
        ),
        titleMedium: TextStyle(
          //footNote2
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: colors.onSecondary,
        ),
        titleSmall: TextStyle(
          //footNote3
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: colors.onSecondary,
        ),

        // Headline styles
        headlineLarge: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: colors.onSecondary,
        ),
        headlineMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: colors.onSecondary,
        ),
        headlineSmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.normal,
          color: colors.onSecondary,
        ),
      );

  @override
  TabBarThemeData get tabBarTheme => TabBarThemeData(
        dividerColor: Colors.transparent,
        labelColor: colors.primary,
        unselectedLabelColor: colors.onSurface,
        indicatorColor: colors.primary,
        labelStyle: textTheme?.titleMedium,
        unselectedLabelStyle: textTheme?.titleSmall,
      );
}
