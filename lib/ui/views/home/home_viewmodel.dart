import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:flutter_valorant_agents/services/api/agent_service.dart';
import 'package:flutter_valorant_agents/ui/views/home/utility/filter_all_agent_role.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel {
  HomeViewModel({
    required ProductNetworkErrorManager productNetworkErrorManager,
  }) : _productNetworkErrorManager = productNetworkErrorManager;

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

  /// Selected agent role
  AgentRole _selectedAgentRole = allFilterAgentRole;
  AgentRole get selectedAgentRole => _selectedAgentRole;

  /// Network error
  NetworkExceptions? _error;
  NetworkExceptions? get getError => _error;

  /// Get agents
  Future<void> getAgents() async {
    _error = null;
    _productNetworkErrorManager.resolve(
      await runBusyFuture(_agentService.getAllAgents()),
      response: (value) {
        _agents = value?.agents ?? [];
        findAllAgentRoles();
      },
      networkExceptions: (value) {
        _error = value;
      },
    );
  }

  /// Find all agent roles
  void findAllAgentRoles() {
    if (_agents.isEmpty) return;
    for (final agent in _agents) {
      if (agent.agentRole != null &&
          agent.agentRole?.displayName != null &&
          agent.agentRole?.displayName!.trim() != '') {
        _agentRoles.add(agent.agentRole!);
      }
    }
    _agentRoles = _agentRoles.toSet().toList();
  }

  /// On agent role selected
  void onAgentRoleSelected(AgentRole agentRole) {
    _selectedAgentRole = agentRole;
    rebuildUi();
  }
}
