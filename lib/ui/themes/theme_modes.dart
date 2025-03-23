enum AppThemeMode {
  /// Light theme
  light,

  /// Dark theme
  dark;

  /// Get the theme mode from the string
  static AppThemeMode fromString(String? value) {
    return AppThemeMode.values.byName(value ?? light.name);
  }
}
