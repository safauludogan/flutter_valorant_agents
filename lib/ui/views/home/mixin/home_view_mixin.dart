import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_view.form.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

/// Home view mixin
mixin HomeViewMixin on StackedView<HomeViewModel>, $HomeView {
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getAgents();
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
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
