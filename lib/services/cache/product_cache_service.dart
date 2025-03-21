import 'package:core/core.dart';
import 'package:flutter_valorant_agents/product/cache/agent/abilities_cache_model.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_cache_model.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_role_cache_model.dart';
import 'package:flutter_valorant_agents/product/cache/agent/recruitment_data_cache_model.dart';
import 'package:flutter_valorant_agents/product/cache/favorite/favorite_agent_cache_model.dart';

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

  late final HiveCacheOperation<AgentCacheModel> agentCacheOperation =
      HiveCacheOperation<AgentCacheModel>();

  late final HiveCacheOperation<AgentRoleCacheModel> agentRoleCacheOperation =
      HiveCacheOperation<AgentRoleCacheModel>();

  late final HiveCacheOperation<RecruitmentDataCacheModel>
      recruitmentDataCacheOperation =
      HiveCacheOperation<RecruitmentDataCacheModel>();

  late final HiveCacheOperation<AbilitiesCacheModel> abilitiesCacheOperation =
      HiveCacheOperation<AbilitiesCacheModel>();

  late final HiveCacheOperation<FavoriteAgentCacheModel>
      favoriteAgentCacheOperation =
      HiveCacheOperation<FavoriteAgentCacheModel>();
}
