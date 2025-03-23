import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/themes/app_themes.dart';
import 'package:flutter_valorant_agents/ui/themes/theme_modes.dart';
import 'package:stacked/stacked.dart';

class ThemeService with ListenableServiceMixin {
  ThemeService() {
    listenToReactiveValues([_themeMode]);
  }

  AppThemeMode _themeMode = AppThemeMode.light;

  /// The current theme mode
  AppThemeMode get themeMode => _themeMode;

  /// The current theme
  ThemeData get theme => _themeMode == AppThemeMode.light
      ? AppThemes.lightTheme
      : AppThemes.darkTheme;

  /// Whether the current theme is dark
  bool get isDarkMode => _themeMode == AppThemeMode.dark;

  /// Updates the theme mode
  void updateThemeMode(AppThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    notifyListeners();
  }
}
