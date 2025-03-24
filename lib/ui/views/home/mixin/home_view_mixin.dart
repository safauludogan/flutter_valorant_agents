import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/services/common/toast_service.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_view.form.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

/// Home view mixin
mixin HomeViewMixin on StackedView<HomeViewModel>, $HomeView {
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel
      ..getAgents()
      ..getAllFavoriteAgents();
    syncFormWithViewModel(viewModel);

    /// Hide keyboard
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
  }

  @override
  void onDispose(HomeViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel(
        agentRepository: locator<IAgentRepository>(),
        favoriteAgentRepository: locator<IFavoriteAgentRepository>(),
        bottomSheetService: locator<BottomSheetService>(),
        navigationService: locator<NavigationService>(),
        toastService: locator<ToastService>(),
        dialogService: locator<DialogService>(),
      );
}
