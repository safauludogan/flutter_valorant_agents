import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/locales.dart';
import 'package:flutter_valorant_agents/services/app/localization_service.dart';
import 'package:flutter_valorant_agents/services/app/theme_service.dart';
import 'package:flutter_valorant_agents/services/cache/product_shared_cache_service.dart';
import 'package:flutter_valorant_agents/ui/themes/theme_modes.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends ReactiveViewModel {
  final _themeService = locator<ThemeService>();
  final _localizationService = locator<LocalizationService>();
  final _productSharedCacheService = locator<ProductSharedCacheService>();

  /// Change theme
  bool _isTurkish = true;
  bool get isTurkish => _isTurkish;

  /// Change theme
  bool _isLightTheme = true;
  bool get isLightTheme => _isLightTheme;

  /// When language changed refresh agent list for language
  bool _isLanguageChanged = false;
  bool get isLanguageChanged => _isLanguageChanged;

  /// Change theme
  void changeTheme(AppThemeMode themeMode) {
    setBusy(true);
    _themeService.updateThemeMode(themeMode);
    _isLightTheme = themeMode == AppThemeMode.light;
    rebuildUi();

    /// Save theme mode to shared cache
    _productSharedCacheService.add(SharedKeys.themeMode, themeMode.name);
    setBusy(false);
  }

  /// Change language
  Future<void> changeLanguage(Locales locale,
      {required BuildContext context}) async {
    if (_isTurkish && locale == Locales.tr ||
        !_isTurkish && locale == Locales.en) {
      return;
    }
    setBusy(true);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!context.mounted) return;
    _localizationService.updateLanguage(context: context, value: locale);
    _isTurkish = locale == Locales.tr;
    _isLanguageChanged = true;
    rebuildUi();
    setBusy(false);
  }

  /// Localization control
  void localizationControl(BuildContext context) {
    _localizationService.getCurrentLocale(context) ==
            Locales.tr.locale.countryCode
        ? _isTurkish = true
        : _isTurkish = false;
    rebuildUi();
  }

  /// Theme control
  void themeControl() {
    _isLightTheme = !_themeService.isDarkMode;
    rebuildUi();
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_themeService, _localizationService];
}
