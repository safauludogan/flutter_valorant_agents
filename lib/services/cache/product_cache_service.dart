import 'package:core/core.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_response_cache_model.dart';

class ProductCacheService {
  ProductCacheService() : _cacheManager = HiveCacheManager();

  final CacheManager _cacheManager;

  /// Initialize the cache manager
  Future<void> init() async {
    await _cacheManager.init();
  }

  /// Remove the cache from the disk
  Future<void> removeFromDisk() async {
    await _cacheManager.remove();
  }

  /// Register cache models
  void register<T extends CacheModel<T>>(T model, HiveAdapterId hiveAdapterId) {
    _cacheManager.register(model, hiveAdapterId);
  }

  late final HiveCacheOperation<AgentResponseCacheModel>
      agentResponseCacheOperation =
      HiveCacheOperation<AgentResponseCacheModel>();
}
