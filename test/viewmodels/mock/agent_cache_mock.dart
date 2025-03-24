import 'package:core/core.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_cache_model.dart';
import 'package:mockito/mockito.dart';

class AgentCacheMock extends Mock
    implements HiveCacheOperation<AgentCacheModel> {
  List<AgentCacheModel> _agentResponse = [];

  List<AgentCacheModel> get mockAgents => _agentResponse;
  set mockAgents(List<AgentCacheModel> value) {
    _agentResponse = value;
  }

  @override
  List<AgentCacheModel> getAll() {
    return _agentResponse;
  }

  @override
  AgentCacheModel? get(String id) {
    try {
      return _agentResponse.firstWhere(
        (element) => element.agent.uuid == id,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> clear() async {
    _agentResponse.clear();
  }

  @override
  void add(AgentCacheModel item) {
    _agentResponse.add(item);
  }
}
