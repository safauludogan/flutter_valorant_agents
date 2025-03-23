import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/ui/views/agents/agents_view.dart';
import 'package:flutter_valorant_agents/ui/views/favorite_agents/favorite_agents_view.dart';
import 'package:gen/gen.dart';

enum HomePages {
  agents,
  favoriteAgents;

  Widget getPage({
    required List<Agent> agents,
    required AgentRole? selectedAgentRole,
    required void Function(Agent, bool) onFavoriteTap,
    required List<FavoriteAgent> favoriteAgents,
    required Future<void> Function() onRefresh,
    required VoidCallback checkFavoriteAgentRefresh,
    required void Function(FavoriteAgent) onNotesTap,
  }) {
    switch (this) {
      case HomePages.agents:
        return AgentsView(
          agents: agents,
          selectedAgentRole: selectedAgentRole,
          onFavoriteTap: onFavoriteTap,
          favoriteAgents: favoriteAgents,
          onRefresh: onRefresh,
          checkFavoriteAgentRefresh: checkFavoriteAgentRefresh,
          onNotesTap: onNotesTap,
        );
      case HomePages.favoriteAgents:
        return FavoriteAgentsView(
          agents: agents,
          selectedAgentRole: selectedAgentRole,
          onFavoriteTap: onFavoriteTap,
          favoriteAgents: favoriteAgents,
          onRefresh: onRefresh,
          checkFavoriteAgentRefresh: checkFavoriteAgentRefresh,
          onNotesTap: onNotesTap,
        );
    }
  }

  String getTitle() {
    switch (this) {
      case HomePages.agents:
        return LocaleKeys.home_pages_agents.tr();
      case HomePages.favoriteAgents:
        return LocaleKeys.home_pages_favoriteAgents.tr();
    }
  }
}
