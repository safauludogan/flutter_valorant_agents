import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/services/app/theme_service.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends ReactiveViewModel with ListenableServiceMixin {
  final ThemeService _themeService = locator<ThemeService>();

  /// The current theme
  ThemeData get theme => _themeService.theme;

  @override
  List<ListenableServiceMixin> get listenableServices => [_themeService];
}
