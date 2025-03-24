import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';

import 'agent_cache_mock.dart';
import 'agent_service_mock.dart';

final class MockAgentRepository extends Mock implements IAgentRepository {
  MockAgentRepository({
    required this.mockAgentService,
    required this.agentCacheMock,
  });

  final AgentServiceMock mockAgentService;
  final AgentCacheMock agentCacheMock;

  @override
  Future<List<Agent>?> getAgentsFromRemote() async {
    final result = await mockAgentService.getAgentsFromRemote();
    return result;
  }

  @override
  Future<Agent?> getAgentByIdFromRemote({required String id}) async {
    final result = await mockAgentService.getAgentByIdFromRemote(id: id);
    return result;
  }

  @override
  Future<List<Agent>> getAgentsFromCache() async {
    return agentCacheMock.getAll().map((e) => e.agent).toList();
  }

  @override
  Future<Agent?> getAgentByIdFromCache({required String id}) async {
    return agentCacheMock.get(id)?.agent;
  }

  @override
  void saveAgentsToCache(List<Agent> agents) {
    agentCacheMock.clear();
  }
}
