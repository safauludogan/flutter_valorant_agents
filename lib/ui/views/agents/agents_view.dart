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
    required this.checkFavoriteAgentRefresh,
    required this.onNotesTap,
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
  final VoidCallback checkFavoriteAgentRefresh;

  /// On notes tap
  final void Function(FavoriteAgent) onNotesTap;

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
          phone: _Body(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgentRefresh),
            onNotesTap: onNotesTap,
          ),
          tablet: _Body(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgentRefresh),
            onNotesTap: onNotesTap,
          ),
          desktop: _Body(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onAgentTap: (agent) => viewModel.navigateToAgentDetail(
                agent.uuid!, checkFavoriteAgentRefresh),
            onNotesTap: onNotesTap,
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

class _Body extends StatelessWidget {
  const _Body({
    super.key,
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onAgentTap,
    required this.onNotesTap,
  });

  final List<Agent> agents;
  final AgentRole? selectedAgentRole;
  final void Function(Agent p1, bool p2) onFavoriteTap;
  final List<FavoriteAgent> favoriteAgents;
  final void Function(Agent) onAgentTap;
  final void Function(FavoriteAgent) onNotesTap;

  @override
  Widget build(BuildContext context) {
    return AgentsCardListView(
      agents: agents,
      selectedAgentRole: selectedAgentRole,
      onFavoriteTap: onFavoriteTap,
      favoriteAgents: favoriteAgents,
      onAgentTap: onAgentTap,
      onNotesTap: onNotesTap,
    );
  }
}
