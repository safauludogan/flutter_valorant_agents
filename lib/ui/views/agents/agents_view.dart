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
    AgentsViewModel viewModel,
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
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgent),
          ),
          tablet: _body(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgent),
          ),
          desktop: _body(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgent),
          ),
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

class _body extends StatelessWidget {
  const _body({
    super.key,
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onAgentTap,
  });

  final List<Agent> agents;
  final AgentRole? selectedAgentRole;
  final void Function(Agent p1, bool p2) onFavoriteTap;
  final List<FavoriteAgent> favoriteAgents;
  final void Function(Agent) onAgentTap;

  @override
  Widget build(BuildContext context) {
    return AgentsCardListView(
      agents: agents,
      selectedAgentRole: selectedAgentRole,
      onFavoriteTap: onFavoriteTap,
      favoriteAgents: favoriteAgents,
      onAgentTap: onAgentTap,
    );
  }
}
