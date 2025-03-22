import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/app/app.router.dart';
import 'package:flutter_valorant_agents/product/extension/string_extension.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FavoriteAgentsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<Agent> getFavoriteAgents(
    List<Agent> agents,
    List<FavoriteAgent> favoriteAgents,
  ) {
    return agents
        .where((agent) => favoriteAgents.any(
            (favorite) => favorite.agentId?.compareUuid(agent.uuid) ?? false))
        .toList();
  }

  /// Navigation
  void navigateToAgentDetail(String agentId) =>
      _navigationService.navigateToAgentDetailView(agentId: agentId);
}
