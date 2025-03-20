import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:flutter_valorant_agents/services/api/agent_service.dart';
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

  NetworkExceptions? _error;

  /// Error
  NetworkExceptions? get getError => _error;

  /// Get agents
  Future<void> getAgents() async {
    _error = null;
    _productNetworkErrorManager.resolve(
      await runBusyFuture(_agentService.getAllAgents()),
      response: (value) {
        _agents = value?.agents ?? [];
      },
      networkExceptions: (value) {
        _error = value;
      },
    );
  }
}
