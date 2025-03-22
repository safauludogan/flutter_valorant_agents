import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/agents_card_listview.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:widgets/widgets.dart';

import 'agents_viewmodel.dart';

class AgentsView extends StackedView<AgentsViewModel> {
  const AgentsView({
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onRefresh,
  });

  /// Agents
  final List<Agent> agents;

  /// Selected agent role
  final AgentRole? selectedAgentRole;

  /// On favorite tap
  final void Function(Agent, bool) onFavoriteTap;

  /// Favorite agents
  final List<FavoriteAgent> favoriteAgents;

  /// On refresh
  final Future<void> Function() onRefresh;

  @override
  Widget builder(
    BuildContext context,
    AgentsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: CustomRefreshIndicator(
        isListView: true,
        onRefresh: onRefresh,
        child: AgentsCardListView(
          agents: agents,
          selectedAgentRole: selectedAgentRole,
          onFavoriteTap: onFavoriteTap,
          favoriteAgents: favoriteAgents,
        ),
      ),
    );
  }

  @override
  AgentsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AgentsViewModel();
}
