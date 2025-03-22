import 'package:flutter_valorant_agents/product/extension/string_extension.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';

class FavoriteAgentsViewModel extends BaseViewModel {
  List<Agent> getFavoriteAgents(
    List<Agent> agents,
    List<FavoriteAgent> favoriteAgents,
  ) {
    return agents
        .where((agent) => favoriteAgents.any(
            (favorite) => favorite.agentId?.compareUuid(agent.uuid) ?? false))
        .toList();
  }
}
