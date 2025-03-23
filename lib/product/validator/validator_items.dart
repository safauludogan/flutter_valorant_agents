import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';

class ValidatorItems {
  const ValidatorItems._();

  /// Validate favorite title
  static String? validateFavoriteTitle(String? text) {
    if ((text?.isEmpty ?? true) || (text != null && text.length < 3)) {
      return LocaleKeys.validator_favoriteTitleMustBeAtLeast3Characters.tr();
    }
    return null;
  }

  /// Validate favorite description
  static String? validateFavoriteDescription(String? text) {
    if ((text?.isEmpty ?? true) || (text != null && text.length < 10)) {
      return LocaleKeys.validator_favoriteDescriptionMustBeAtLeast10Characters
          .tr();
    }
  }
}
