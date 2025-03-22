import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/agents_card_listview.dart';
import 'package:stacked/stacked.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

import 'favorite_agents_viewmodel.dart';

class FavoriteAgentsView extends StackedView<FavoriteAgentsViewModel> {
  const FavoriteAgentsView({
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
    FavoriteAgentsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomRefreshIndicator(
        isListView: true,
        onRefresh: onRefresh,
        child: AdaptAllView(
          phone: _body(
              agents: agents,
              favoriteAgents: favoriteAgents,
              selectedAgentRole: selectedAgentRole,
              onFavoriteTap: onFavoriteTap,
              viewModel: viewModel),
          tablet: _body(
              agents: agents,
              favoriteAgents: favoriteAgents,
              selectedAgentRole: selectedAgentRole,
              onFavoriteTap: onFavoriteTap,
              viewModel: viewModel),
          desktop: _body(
              agents: agents,
              favoriteAgents: favoriteAgents,
              selectedAgentRole: selectedAgentRole,
              onFavoriteTap: onFavoriteTap,
              viewModel: viewModel),
        ),
      ),
    );
  }

  @override
  FavoriteAgentsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavoriteAgentsViewModel();
}

class _body extends StatelessWidget {
  const _body({
    super.key,
    required this.agents,
    required this.favoriteAgents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.viewModel,
  });

  final List<Agent> agents;
  final List<FavoriteAgent> favoriteAgents;
  final AgentRole? selectedAgentRole;
  final void Function(Agent p1, bool p2) onFavoriteTap;
  final FavoriteAgentsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AgentsCardListView(
      agents: viewModel.getFavoriteAgents(agents, favoriteAgents),
      selectedAgentRole: selectedAgentRole,
      onFavoriteTap: onFavoriteTap,
      favoriteAgents: favoriteAgents,
    );
  }
}
