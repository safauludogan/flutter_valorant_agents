import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/views/home/widget/agents_card_listview.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:widgets/widgets.dart';

import 'favorite_agents_viewmodel.dart';

class FavoriteAgentsView extends StackedView<FavoriteAgentsViewModel> {
  const FavoriteAgentsView({
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onRefresh,
    required this.checkFavoriteAgent,
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

  /// Check favorite agent
  final VoidCallback checkFavoriteAgent;

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
          phone: _Body(
            agents: agents,
            favoriteAgents: favoriteAgents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            viewModel: viewModel,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgent),
            checkFavoriteAgent: checkFavoriteAgent,
          ),
          tablet: _Body(
            agents: agents,
            favoriteAgents: favoriteAgents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            viewModel: viewModel,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgent),
            checkFavoriteAgent: checkFavoriteAgent,
          ),
          desktop: _Body(
            agents: agents,
            favoriteAgents: favoriteAgents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            viewModel: viewModel,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgent),
            checkFavoriteAgent: checkFavoriteAgent,
          ),
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

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.agents,
    required this.favoriteAgents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.viewModel,
    required this.onAgentTap,
    required this.checkFavoriteAgent,
  });

  final List<Agent> agents;
  final List<FavoriteAgent> favoriteAgents;
  final AgentRole? selectedAgentRole;
  final void Function(Agent p1, bool p2) onFavoriteTap;
  final FavoriteAgentsViewModel viewModel;
  final VoidCallback checkFavoriteAgent;
  final void Function(Agent) onAgentTap;

  @override
  Widget build(BuildContext context) {
    return AgentsCardListView(
      agents: viewModel.getFavoriteAgents(agents, favoriteAgents),
      selectedAgentRole: selectedAgentRole,
      onFavoriteTap: onFavoriteTap,
      favoriteAgents: favoriteAgents,
      onAgentTap: (agent) =>
          viewModel.navigateToAgentDetail(agent.uuid!, checkFavoriteAgent),
    );
  }
}
