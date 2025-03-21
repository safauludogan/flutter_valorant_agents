import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/themes/dark/dark_theme.dart';
import 'package:flutter_valorant_agents/ui/themes/light/light_theme.dart';

final class AppThemes {
  static ThemeData get lightTheme => LightTheme.instance.themeData;
  static ThemeData get darkTheme => DarkTheme.instance.themeData;
}
