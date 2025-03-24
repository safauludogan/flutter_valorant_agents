import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_cache_model.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_viewmodel.dart';
import 'package:mockito/annotations.dart';

import 'mock/agent_cache_mock.dart';
import 'mock/agent_repository_mock.dart';
import 'mock/agent_response_mock.dart';
import 'mock/agent_service_mock.dart';

@GenerateMocks([IAgentRepository])
void main() {
  late HomeViewModel homeViewModel;
  late AgentCacheMock agentCacheMock;
  late AgentServiceMock agentServiceMock;
  late MockAgentRepository mockAgentRepository;

  setUp(() {
    agentCacheMock = AgentCacheMock();
    agentServiceMock = AgentServiceMock();
    mockAgentRepository = MockAgentRepository(
      mockAgentService: agentServiceMock,
      agentCacheMock: agentCacheMock,
    );
    homeViewModel = HomeViewModel(agentRepository: mockAgentRepository);
  });

  group('HomeViewModel Tests', () {
    test('Initial state test', () {
      expect(homeViewModel.isBusy, false);
      expect(homeViewModel.agents, isEmpty);
      expect(homeViewModel.constantAgents, isEmpty);
    });

    test('getAgents from cache success test', () async {
      final mockAgents = AgentResponseMock.agentResponse.agents!;
      agentCacheMock.mockAgents =
          mockAgents.map((e) => AgentCacheModel(agent: e)).toList();

      await homeViewModel.getAgents();

      expect(homeViewModel.agents, isNotEmpty);
      expect(homeViewModel.agents.length, equals(mockAgents.length));
      expect(homeViewModel.agents.first.displayName, equals('Agent 1'));
    });

    test('search functionality test', () async {
      final mockAgents = AgentResponseMock.agentResponse.agents!;
      agentCacheMock.mockAgents =
          mockAgents.map((e) => AgentCacheModel(agent: e)).toList();
      await homeViewModel.getAgents();

      homeViewModel.onSearchInputChanged('Agent 1');

      expect(homeViewModel.agents.length, 1);
      expect(homeViewModel.agents.first.displayName, 'Agent 1');
    });

    test('agent role filter test', () async {
      final mockAgents = AgentResponseMock.agentResponse.agents!;
      agentCacheMock.mockAgents =
          mockAgents.map((e) => AgentCacheModel(agent: e)).toList();
      await homeViewModel.getAgents();

      homeViewModel.onAgentRoleSelected(mockAgents.first.role!);

      expect(homeViewModel.selectedAgentRole, equals(mockAgents.first.role));
    });
  });
}
