import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'agent_detail_viewmodel.dart';

class AgentDetailView extends StackedView<AgentDetailViewModel> {
  const AgentDetailView({
    required this.agentId,
    Key? key,
  }) : super(key: key);

  /// Agent ID
  final String agentId;

  @override
  Widget builder(
    BuildContext context,
    AgentDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(child: Text(agentId)),
      ),
    );
  }

  @override
  AgentDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AgentDetailViewModel();
}
