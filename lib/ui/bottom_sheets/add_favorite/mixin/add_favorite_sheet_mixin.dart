import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet.form.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet_model.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';

mixin AddFavoriteSheetMixin
    on StackedView<AddFavoriteSheetModel>, $AddFavoriteSheet {
  /// Is add favorite
  bool isAddFavorite = false;

  @override
  void onDispose(AddFavoriteSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  /// Initialize controllers
  /// Is add favorite is true then data is FavoriteAgent
  /// Is add favorite is false then data is String
  void initializeControllers(dynamic data) {
    if (data is FavoriteAgent) {
      isAddFavorite = false;
      titleInputController.text = data.title ?? '';
      descriptionInputController.text = data.description ?? '';
    } else {
      isAddFavorite = true;
    }
  }
}
