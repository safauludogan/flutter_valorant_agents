import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/locales.dart';
import 'package:stacked/stacked.dart';

//class LocalizationService with ListenableServiceMixin {
class LocalizationService with ListenableServiceMixin {
  /// Change app language by using [Locales]
  void updateLanguage({
    required BuildContext context,
    required Locales value,
  }) {
    EasyLocalization.of(context)!.setLocale(value.locale);
    notifyListeners();
  }

  /// Get current locale
  String getCurrentLocale(BuildContext context) =>
      Localizations.localeOf(context).countryCode ?? '';

  /// Get current locale
  String getCurrentLocaleLanguageTag(BuildContext context) =>
      Localizations.localeOf(context).toLanguageTag();
}