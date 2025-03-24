import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';

import 'agent_response_mock.dart';

final class AgentServiceMock extends Mock implements IAgentRepository {
  @override
  Future<List<Agent>?> getAgentsFromRemote() async {
    return Future.microtask(() => AgentResponseMock.agentResponse.agents);
  }

  @override
  Future<Agent?> getAgentByIdFromRemote({required String id}) {
    final agent = AgentResponseMock.agentResponse.agents
        ?.firstWhere((element) => element.uuid == id);
    return Future.microtask(() => agent);
  }
}
