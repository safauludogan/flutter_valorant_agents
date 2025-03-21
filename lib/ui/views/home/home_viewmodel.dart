import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/manager/network_error.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/agent/concrete/agent_repository.dart';
import 'package:flutter_valorant_agents/services/api/agent/agent_service.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_view.form.dart';
import 'package:flutter_valorant_agents/ui/views/home/utility/filter_all_agent_role.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel
    with FormStateHelper
    implements FormViewModel {
  HomeViewModel({
    required ProductNetworkErrorManager productNetworkErrorManager,
  }) : _productNetworkErrorManager = productNetworkErrorManager;

  final _agentRepository = locator<IAgentRepository>();

  /// Dialog Service
  final _agentService = locator<AgentService>();

  /// Product network error manager for handling network errors
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  /// Agents private property
  List<Agent> _agents = [];

  /// Agents
  List<Agent> get agents => _agents;

  /// Agent roles
  List<AgentRole> _agentRoles = [];
  List<AgentRole> get agentRoles => _agentRoles;

  List<Agent> baseAgents = [];

  /// Selected agent role
  AgentRole _selectedAgentRole = allFilterAgentRole;
  AgentRole get selectedAgentRole => _selectedAgentRole;

  /// Network error
  NetworkExceptions? _error;
  NetworkExceptions? get getError => _error;

  /// Search value
  String get searchValue => hasSearchInput ? searchInputValue! : '';

  /// Get agents
  Future<void> getAgents() async {
    setBusy(true);
    _error = null;
    try {
      _agents = await _agentRepository.getAgentsFromCache();

      baseAgents = [..._agents];
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

  /// On agent role selected
  void onAgentRoleSelected(AgentRole agentRole) {
    _selectedAgentRole = agentRole;
    rebuildUi();
  }

  /// On search input changed
  void onSearchInputChanged(String text) {
    if (text.isEmpty || text.trim() == '') {
      _agents = baseAgents;
      rebuildUi();
      return;
    }
    final trimText = text.trim().toLowerCase();
    final newAgents = baseAgents
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
}
