import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

/// Home view mixin
mixin HomeViewMixin on StackedView<HomeViewModel> {
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getAgents();
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel(
      productNetworkErrorManager: ProductNetworkErrorManager(context: context));
}
