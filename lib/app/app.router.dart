// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/views/agents/agents_view.dart'
    as _i4;
import 'package:flutter_valorant_agents/ui/views/favorite_agents/favorite_agents_view.dart'
    as _i5;
import 'package:flutter_valorant_agents/ui/views/home/home_view.dart' as _i2;
import 'package:flutter_valorant_agents/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:gen/gen.dart' as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const agentsView = '/agents-view';

  static const favoriteAgentsView = '/favorite-agents-view';

  static const all = <String>{
    homeView,
    startupView,
    agentsView,
    favoriteAgentsView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.AgentsView: (data) {
      final args = data.getArgs<AgentsViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.AgentsView(
            agents: args.agents,
            selectedAgentRole: args.selectedAgentRole,
            onFavoriteTap: args.onFavoriteTap,
            favoriteAgents: args.favoriteAgents,
            onRefresh: args.onRefresh),
        settings: data,
      );
    },
    _i5.FavoriteAgentsView: (data) {
      final args = data.getArgs<FavoriteAgentsViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.FavoriteAgentsView(
            agents: args.agents,
            selectedAgentRole: args.selectedAgentRole,
            onFavoriteTap: args.onFavoriteTap,
            favoriteAgents: args.favoriteAgents,
            onRefresh: args.onRefresh),
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

  final _i6.Key? key;

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
  });

  final List<_i7.Agent> agents;

  final _i7.AgentRole? selectedAgentRole;

  final void Function(
    _i7.Agent,
    bool,
  ) onFavoriteTap;

  final List<_i7.FavoriteAgent> favoriteAgents;

  final _i8.Future<void> Function() onRefresh;

  @override
  String toString() {
    return '{"agents": "$agents", "selectedAgentRole": "$selectedAgentRole", "onFavoriteTap": "$onFavoriteTap", "favoriteAgents": "$favoriteAgents", "onRefresh": "$onRefresh"}';
  }

  @override
  bool operator ==(covariant AgentsViewArguments other) {
    if (identical(this, other)) return true;
    return other.agents == agents &&
        other.selectedAgentRole == selectedAgentRole &&
        other.onFavoriteTap == onFavoriteTap &&
        other.favoriteAgents == favoriteAgents &&
        other.onRefresh == onRefresh;
  }

  @override
  int get hashCode {
    return agents.hashCode ^
        selectedAgentRole.hashCode ^
        onFavoriteTap.hashCode ^
        favoriteAgents.hashCode ^
        onRefresh.hashCode;
  }
}

class FavoriteAgentsViewArguments {
  const FavoriteAgentsViewArguments({
    required this.agents,
    required this.selectedAgentRole,
    required this.onFavoriteTap,
    required this.favoriteAgents,
    required this.onRefresh,
  });

  final List<_i7.Agent> agents;

  final _i7.AgentRole? selectedAgentRole;

  final void Function(
    _i7.Agent,
    bool,
  ) onFavoriteTap;

  final List<_i7.FavoriteAgent> favoriteAgents;

  final _i8.Future<void> Function() onRefresh;

  @override
  String toString() {
    return '{"agents": "$agents", "selectedAgentRole": "$selectedAgentRole", "onFavoriteTap": "$onFavoriteTap", "favoriteAgents": "$favoriteAgents", "onRefresh": "$onRefresh"}';
  }

  @override
  bool operator ==(covariant FavoriteAgentsViewArguments other) {
    if (identical(this, other)) return true;
    return other.agents == agents &&
        other.selectedAgentRole == selectedAgentRole &&
        other.onFavoriteTap == onFavoriteTap &&
        other.favoriteAgents == favoriteAgents &&
        other.onRefresh == onRefresh;
  }

  @override
  int get hashCode {
    return agents.hashCode ^
        selectedAgentRole.hashCode ^
        onFavoriteTap.hashCode ^
        favoriteAgents.hashCode ^
        onRefresh.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i6.Key? key,
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
    required List<_i7.Agent> agents,
    required _i7.AgentRole? selectedAgentRole,
    required void Function(
      _i7.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i7.FavoriteAgent> favoriteAgents,
    required _i8.Future<void> Function() onRefresh,
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
            onRefresh: onRefresh),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavoriteAgentsView({
    required List<_i7.Agent> agents,
    required _i7.AgentRole? selectedAgentRole,
    required void Function(
      _i7.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i7.FavoriteAgent> favoriteAgents,
    required _i8.Future<void> Function() onRefresh,
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
            onRefresh: onRefresh),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i6.Key? key,
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
    required List<_i7.Agent> agents,
    required _i7.AgentRole? selectedAgentRole,
    required void Function(
      _i7.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i7.FavoriteAgent> favoriteAgents,
    required _i8.Future<void> Function() onRefresh,
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
            onRefresh: onRefresh),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavoriteAgentsView({
    required List<_i7.Agent> agents,
    required _i7.AgentRole? selectedAgentRole,
    required void Function(
      _i7.Agent,
      bool,
    ) onFavoriteTap,
    required List<_i7.FavoriteAgent> favoriteAgents,
    required _i8.Future<void> Function() onRefresh,
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
            onRefresh: onRefresh),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
