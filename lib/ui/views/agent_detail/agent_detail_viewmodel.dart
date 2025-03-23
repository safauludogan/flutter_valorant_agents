import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/manager/network_error.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';

class AgentDetailViewModel extends BaseViewModel {
  final _agentRepository = locator<IAgentRepository>();

  /// Agent
  Agent? get agent => _agent;
  Agent? _agent;

  /// Network error
  NetworkExceptions? _error;
  NetworkExceptions? get getError => _error;

  /// Get agent
  Future<void> getAgent({required String agentId}) async {
    setBusy(true);
    _error = null;
    try {
      _agent = await _agentRepository.getAgentByIdFromCache(id: agentId);
    } on NetworkError catch (e) {
      _error = e.networkException;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setBusy(false);
    }
  }
}
