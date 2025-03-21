import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet.form.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet_model.dart';
import 'package:stacked/stacked.dart';

mixin AddFavoriteSheetMixin
    on StackedView<AddFavoriteSheetModel>, $AddFavoriteSheet {
  final formKey = GlobalKey<FormState>();
  @override
  void onViewModelReady(AddFavoriteSheetModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(AddFavoriteSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
