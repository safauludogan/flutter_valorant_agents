import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/locales.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/agent/concrete/agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/concrete/favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/services/app/localization_service.dart';
import 'package:flutter_valorant_agents/services/app/theme_service.dart';
import 'package:flutter_valorant_agents/services/cache/product_shared_cache_service.dart';
import 'package:flutter_valorant_agents/services/common/toast_service.dart';
import 'package:flutter_valorant_agents/ui/themes/theme_modes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends ReactiveViewModel {
  SettingsViewModel({
    required ThemeService themeService,
    required LocalizationService localizationService,
    required ProductSharedCacheService productSharedCacheService,
    required IAgentRepository agentRepository,
    required IFavoriteAgentRepository favoriteAgentRepository,
    required DialogService dialogService,
    required ToastService toastService,
  })  : _themeService = themeService,
        _localizationService = localizationService,
        _productSharedCacheService = productSharedCacheService,
        _agentRepository = agentRepository,
        _favoriteAgentRepository = favoriteAgentRepository,
        _dialogService = dialogService,
        _toastService = toastService;

  final ThemeService _themeService;
  final LocalizationService _localizationService;
  final ProductSharedCacheService _productSharedCacheService;
  final IAgentRepository _agentRepository;
  final IFavoriteAgentRepository _favoriteAgentRepository;
  final DialogService _dialogService;
  final ToastService _toastService;

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

  /// Clear all cache
  Future<void> clearAllCache() async {
    final response = await _dialogService.showConfirmationDialog(
      dialogPlatform: DialogPlatform.Material,
      title: LocaleKeys.settings_clearCache.tr(),
      description: LocaleKeys.general_messages_clearCacheDescription.tr(),
      cancelTitle: LocaleKeys.general_button_cancel.tr(),
      confirmationTitle: LocaleKeys.general_button_clear.tr(),
    );
    if (response?.confirmed ?? false) {
      await _agentRepository.clearCache();
      await _favoriteAgentRepository.clearFavoriteAgents();
      _toastService.showSuccessMessage(
        message: LocaleKeys.general_messages_clearCacheSuccess.tr(),
      );
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_themeService, _localizationService];
}
