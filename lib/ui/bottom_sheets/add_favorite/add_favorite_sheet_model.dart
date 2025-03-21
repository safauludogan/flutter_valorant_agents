import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/services/common/toast_service.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet.form.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddFavoriteSheetModel extends ReactiveViewModel
    with FormStateHelper
    implements FormViewModel {
  final _favoriteAgentRepository = locator<IFavoriteAgentRepository>();
  final _toastService = locator<ToastService>();
  final _navigationService = locator<NavigationService>();

  /// Add favorite
  Future<void> addFavorite(String agentId) async {
    if (hasTitleInputValidationMessage ||
        hasDescriptionInputValidationMessage) {
      return;
    }

    try {
      final result = await _favoriteAgentRepository.addFavoriteAgent(
        favoriteAgent: FavoriteAgent(
          title: titleInputValue,
          description: descriptionInputValue,
          agentId: agentId,
        ),
      );

      if (result) {
        _toastService.showSuccessMessage(
            message: LocaleKeys.general_favorite_messages_favoriteAdded.tr());

        _navigationService.back<void>();
      }
    } on Exception catch (e) {
      _toastService.showErrorMessage(message: e.toString());
    }
  }
}
