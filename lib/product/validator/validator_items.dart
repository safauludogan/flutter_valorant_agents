import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';

class ValidatorItems {
  const ValidatorItems._();

  static String? validateFavoriteTitle(String? text) {
    if ((text?.isEmpty ?? true) || (text != null && text.length < 3)) {
      return LocaleKeys.general_validator_favoriteTitleMustBeAtLeast3Characters
          .tr();
    }
    return null;
  }

  static String? validateFavoriteDescription(String? text) {
    if ((text?.isEmpty ?? true) || (text != null && text.length < 10)) {
      return LocaleKeys
          .general_validator_favoriteDescriptionMustBeAtLeast10Characters
          .tr();
    }
  }
}
