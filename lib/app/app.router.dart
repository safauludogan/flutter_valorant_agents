// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/views/agent_detail/agent_detail_view.dart'
    as _i6;
import 'package:flutter_valorant_agents/ui/views/agents/agents_view.dart'
    as _i4;
import 'package:flutter_valorant_agents/ui/views/favorite_agents/favorite_agents_view.dart'
    as _i5;
import 'package:flutter_valorant_agents/ui/views/home/home_view.dart' as _i2;
import 'package:flutter_valorant_agents/ui/views/settings/settings_view.dart'
    as _i7;
import 'package:flutter_valorant_agents/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:gen/gen.dart' as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const agentsView = '/agents-view';

  static const favoriteAgentsView = '/favorite-agents-view';

  static const agentDetailView = '/agent-detail-view';

  static const settingsView = '/settings-view';

  static const all = <String>{
    homeView,
    startupView,
    agentsView,
    favoriteAgentsView,
    agentDetailView,
    settingsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.agentsView,
      page: _i4.AgentsView,
    ),
    _i1.RouteDef(
      Routes.favoriteAgentsView,
      page: _i5.FavoriteAgentsView,
    ),
    _i1.RouteDef(
      Routes.agentDetailView,
      page: _i6.AgentDetailView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i7.SettingsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i8.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i2.HomeView(key: args.key),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i3.StartupView: (data) {
      return _i8.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.StartupView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i4.AgentsView: (data) {
      final args = data.getArgs<AgentsViewArguments>(nullOk: false);
      return _i8.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i4.AgentsView(
            agents: args.agents,
            selectedAgentRole: args.selectedAgentRole,
            onFavoriteTap: args.onFavoriteTap,
            favoriteAgents: args.favoriteAgents,
            onRefresh: args.onRefresh,
            checkFavoriteAgentRefresh: args.checkFavoriteAgentRefresh,
            onNotesTap: args.onNotesTap),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i5.FavoriteAgentsView: (data) {
      final args = data.getArgs<FavoriteAgentsViewArguments>(nullOk: false);
      return _i8.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i5.FavoriteAgentsView(
                agents: args.agents,
                selectedAgentRole: args.selectedAgentRole,
                onFavoriteTap: args.onFavoriteTap,
                favoriteAgents: args.favoriteAgents,
                onRefresh: args.onRefresh,
                checkFavoriteAgentRefresh: args.checkFavoriteAgentRefresh,
                onNotesTap: args.onNotesTap),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i6.AgentDetailView: (data) {
      final args = data.getArgs<AgentDetailViewArguments>(nullOk: false);
      return _i8.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i6.AgentDetailView(agentId: args.agentId, key: args.key),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i7.SettingsView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SettingsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AgentsViewArguments {
  const AgentsViewArguments({
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onRefresh,
    required this.checkFavoriteAgentRefresh,
    required this.onNotesTap,
  });

  final List<_i9.Agent> agents;

  final _i9.AgentRole? selectedAgentRole;

  final void Function(
    _i9.Agent,
    bool,
  ) onFavoriteTap;

  final List<_i9.FavoriteAgent> favoriteAgents;

  final _i10.Future<void> Function() onRefresh;

  final void Function() checkFavoriteAgentRefresh;

  final void Function(_i9.FavoriteAgent) onNotesTap;

  @override
  String toString() {
    return '{"agents": "$agents", "selectedAgentRole": "$selectedAgentRole", "onFavoriteTap": "$onFavoriteTap", "favoriteAgents": "$favoriteAgents", "onRefresh": "$onRefresh", "checkFavoriteAgentRefresh": "$checkFavoriteAgentRefresh", "onNotesTap": "$onNotesTap"}';
  }

  @override
  bool operator ==(covariant AgentsViewArguments other) {
    if (identical(this, other)) return true;
    return other.agents == agents &&
        other.selectedAgentRole == selectedAgentRole &&
        other.onFavoriteTap == onFavoriteTap &&
        other.favoriteAgents == favoriteAgents &&
        other.onRefresh == onRefresh &&
        other.checkFavoriteAgentRefresh == checkFavoriteAgentRefresh &&
        other.onNotesTap == onNotesTap;
  }

  @override
  int get hashCode {
    return agents.hashCode ^
        selectedAgentRole.hashCode ^
        onFavoriteTap.hashCode ^
        favoriteAgents.hashCode ^
        onRefresh.hashCode ^
        checkFavoriteAgentRefresh.hashCode ^
        onNotesTap.hashCode;
  }
}

class FavoriteAgentsViewArguments {
  const FavoriteAgentsViewArguments({
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onRefresh,
    required this.checkFavoriteAgentRefresh,
    required this.onNotesTap,
  });

  final List<_i9.Agent> agents;

  final _i9.AgentRole? selectedAgentRole;

  final void Function(
    _i9.Agent,
    bool,
  ) onFavoriteTap;

  final List<_i9.FavoriteAgent> favoriteAgents;

  final _i10.Future<void> Function() onRefresh;

  final void Function() checkFavoriteAgentRefresh;

  final void Function(_i9.FavoriteAgent) onNotesTap;

  @override
  String toString() {
    return '{"agents": "$agents", "selectedAgentRole": "$selectedAgentRole", "onFavoriteTap": "$onFavoriteTap", "favoriteAgents": "$favoriteAgents", "onRefresh": "$onRefresh", "checkFavoriteAgentRefresh": "$checkFavoriteAgentRefresh", "onNotesTap": "$onNotesTap"}';
  }

  @override
  bool operator ==(covariant FavoriteAgentsViewArguments other) {
    if (identical(this, other)) return true;
    return other.agents == agents &&
        other.selectedAgentRole == selectedAgentRole &&
        other.onFavoriteTap == onFavoriteTap &&
        other.favoriteAgents == favoriteAgents &&
        other.onRefresh == onRefresh &&
        other.checkFavoriteAgentRefresh == checkFavoriteAgentRefresh &&
        other.onNotesTap == onNotesTap;
  }

  @override
  int get hashCode {
    return agents.hashCode ^
        selectedAgentRole.hashCode ^
        onFavoriteTap.hashCode ^
        favoriteAgents.hashCode ^
        onRefresh.hashCode ^
        checkFavoriteAgentRefresh.hashCode ^
        onNotesTap.hashCode;
  }
}

class AgentDetailViewArguments {
  const AgentDetailViewArguments({
    required this.agentId,
    this.key,
  });

  final String agentId;

  final _i8.Key? key;

  @override
  String toString() {
    return '{"agentId": "$agentId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AgentDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.agentId == agentId && other.key == key;
  }

  @override
  int get hashCode {
    return agentId.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAgentsView({
    required List<_i9.Agent> agents,
    required _i9.AgentRole? selectedAgentRole,
    required void Function(
      _i9.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i9.FavoriteAgent> favoriteAgents,
    required _i10.Future<void> Function() onRefresh,
    required void Function() checkFavoriteAgentRefresh,
    required void Function(_i9.FavoriteAgent) onNotesTap,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.agentsView,
        arguments: AgentsViewArguments(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onRefresh: onRefresh,
            checkFavoriteAgentRefresh: checkFavoriteAgentRefresh,
            onNotesTap: onNotesTap),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavoriteAgentsView({
    required List<_i9.Agent> agents,
    required _i9.AgentRole? selectedAgentRole,
    required void Function(
      _i9.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i9.FavoriteAgent> favoriteAgents,
    required _i10.Future<void> Function() onRefresh,
    required void Function() checkFavoriteAgentRefresh,
    required void Function(_i9.FavoriteAgent) onNotesTap,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.favoriteAgentsView,
        arguments: FavoriteAgentsViewArguments(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onRefresh: onRefresh,
            checkFavoriteAgentRefresh: checkFavoriteAgentRefresh,
            onNotesTap: onNotesTap),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAgentDetailView({
    required String agentId,
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.agentDetailView,
        arguments: AgentDetailViewArguments(agentId: agentId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAgentsView({
    required List<_i9.Agent> agents,
    required _i9.AgentRole? selectedAgentRole,
    required void Function(
      _i9.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i9.FavoriteAgent> favoriteAgents,
    required _i10.Future<void> Function() onRefresh,
    required void Function() checkFavoriteAgentRefresh,
    required void Function(_i9.FavoriteAgent) onNotesTap,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.agentsView,
        arguments: AgentsViewArguments(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onRefresh: onRefresh,
            checkFavoriteAgentRefresh: checkFavoriteAgentRefresh,
            onNotesTap: onNotesTap),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavoriteAgentsView({
    required List<_i9.Agent> agents,
    required _i9.AgentRole? selectedAgentRole,
    required void Function(
      _i9.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i9.FavoriteAgent> favoriteAgents,
    required _i10.Future<void> Function() onRefresh,
    required void Function() checkFavoriteAgentRefresh,
    required void Function(_i9.FavoriteAgent) onNotesTap,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.favoriteAgentsView,
        arguments: FavoriteAgentsViewArguments(
            agents: agents,
            selectedAgentRole: selectedAgentRole,
            onFavoriteTap: onFavoriteTap,
            favoriteAgents: favoriteAgents,
            onRefresh: onRefresh,
            checkFavoriteAgentRefresh: checkFavoriteAgentRefresh,
            onNotesTap: onNotesTap),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAgentDetailView({
    required String agentId,
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.agentDetailView,
        arguments: AgentDetailViewArguments(agentId: agentId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
