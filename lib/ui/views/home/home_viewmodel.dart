import 'dart:async';

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/app/app.bottomsheets.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/app/app.router.dart';
import 'package:flutter_valorant_agents/product/manager/network_error.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_view.form.dart';
import 'package:flutter_valorant_agents/ui/views/home/utility/filter_all_agent_role.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel
    with FormStateHelper
    implements FormViewModel {
  final _agentRepository = locator<IAgentRepository>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _favoriteAgentRepository = locator<IFavoriteAgentRepository>();
  final _navigationService = locator<NavigationService>();

  /// Agents private property
  List<Agent> _agents = [];

  /// Agents
  List<Agent> get agents => _agents;
  List<Agent> constantAgents = [];

  /// Agent roles
  List<AgentRole> _agentRoles = [];
  List<AgentRole> get agentRoles => _agentRoles;

  /// Selected agent role
  AgentRole _selectedAgentRole = allFilterAgentRole;
  AgentRole get selectedAgentRole => _selectedAgentRole;

  /// Network error
  NetworkExceptions? _error;
  NetworkExceptions? get getError => _error;

  /// Favorite agents
  List<FavoriteAgent> _favoriteAgents = [];
  List<FavoriteAgent> get favoriteAgents => _favoriteAgents;

  /// Search value
  String get searchValue => hasSearchInput ? searchInputValue! : '';

  /// Get agents
  Future<void> getAgents() async {
    setBusy(true);
    _error = null;
    try {
      _agents = await _agentRepository.getAgentsFromCache();

      constantAgents = [..._agents];
      findAllAgentRoles();
    } on NetworkError catch (e) {
      _error = e.networkException;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setBusy(false);
    }
  }

  /// Find all agent roles
  void findAllAgentRoles() {
    if (_agents.isEmpty) return;
    for (final agent in _agents) {
      if (agent.role != null &&
          agent.role?.displayName != null &&
          agent.role?.displayName!.trim() != '') {
        _agentRoles.add(agent.role!);
      }
    }
    _agentRoles = _agentRoles.toSet().toList();
  }

  /// On agent role selected show agents based on selected agent role
  void onAgentRoleSelected(AgentRole agentRole) {
    _selectedAgentRole = agentRole;
    rebuildUi();
  }

  /// On search input changed
  void onSearchInputChanged(String text) {
    if (text.isEmpty || text.trim() == '') {
      _agents = constantAgents;
      rebuildUi();
      return;
    }
    final trimText = text.trim().toLowerCase();
    final newAgents = constantAgents
        .where(
          (agent) =>
              (agent.displayName?.trim().toLowerCase().contains(trimText) ??
                  false) ||
              (agent.description?.trim().toLowerCase().contains(trimText) ??
                  false),
        )
        .toList();
    _agents = newAgents;
    rebuildUi();
  }

  /// On favorite tap
  Future<void> onFavoriteTap(Agent agent, bool isFavorite) async {
    if (!isFavorite) {
      await _addFavoriteAgent(agent);
    } else {
      await _removeOrUpdateFavoriteAgent(agent);
    }
  }

  Future<void> _addFavoriteAgent(Agent agent) async {
    final response = await _bottomSheetService.showCustomSheet<bool, String>(
        variant: BottomSheetType.addFavorite,
        isScrollControlled: true,
        title: agent.displayName,
        data: agent.uuid);
    if (response?.data ?? false) {
      unawaited(getAllFavoriteAgents());
      rebuildUi();
    }
  }

  Future<void> _removeOrUpdateFavoriteAgent(Agent agent) async {
    final favoriteAgent =
        _favoriteAgentRepository.getFavoriteAgent(agentId: agent.uuid!);

    final response =
        await _bottomSheetService.showCustomSheet<bool, FavoriteAgent>(
            variant: BottomSheetType.addFavorite,
            isScrollControlled: true,
            title: agent.displayName,
            data: favoriteAgent);
    if (response?.data ?? false) {
      unawaited(getAllFavoriteAgents());
      rebuildUi();
    }
  }

  /// Get all favorite agents
  Future<void> getAllFavoriteAgents() async {
    _favoriteAgents = _favoriteAgentRepository.getFavoriteAgents();
    rebuildUi();
  }

  /// Navigate to settings
  void navigateToSettings() => _navigationService.navigateToSettingsView();
}
