import 'dart:async';

import 'package:core/core.dart';
import 'package:dio_nexus/dio_nexus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_cache_model.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/manager/network_error.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/services/api/agent/agent_service.dart';
import 'package:gen/gen.dart';

@immutable
final class AgentRepository extends IAgentRepository {
  AgentRepository({
    required HiveCacheOperation<AgentCacheModel> agentCacheOperation,
    required ProductNetworkErrorManager productNetworkErrorManager,
  })  : _agentCacheOperation = agentCacheOperation,
        _productNetworkErrorManager = productNetworkErrorManager;

  /// Agent cache manager
  final HiveCacheOperation<AgentCacheModel> _agentCacheOperation;

  /// Agent service
  final _agentService = locator<AgentService>();

  /// Product network error manager
  final ProductNetworkErrorManager _productNetworkErrorManager;

  /// API
  @override
  Future<List<Agent>?> getAgentsFromRemote() async {
    var response = <Agent>[];
    try {
      _productNetworkErrorManager.resolve(
        await _agentService.getAllAgents(),
        response: (value) {
          response = value?.agents ?? [];
        },
        networkExceptions: (value) {
          if (value != null) {
            throw NetworkError(value);
          }
        },
      );

      if (response.isNotEmpty) {
        await clearCache();
        saveAgentsToCache(response);
      }

      return response;
    } catch (e) {
      if (e is NetworkError) {
        rethrow;
      }
      throw NetworkError(
        NetworkExceptions.defaultError(
            error: LocaleKeys.general_messages_somethingWentWrong.tr()),
      );
    }
  }

  @override
  Future<Agent?> getAgentByIdFromRemote({required String id}) async {
    Agent? agent;
    try {
      _productNetworkErrorManager.resolve(
        await _agentService.getAllAgentById(id: id),
        response: (value) {
          agent = value?.agents?.first;
        },
        networkExceptions: (value) {
          if (value != null) {
            throw NetworkError(value);
          }
        },
      );

      return agent;
    } catch (e) {
      if (e is NetworkError) {
        rethrow;
      }
      throw NetworkError(
        NetworkExceptions.defaultError(
            error: LocaleKeys.general_messages_somethingWentWrong.tr()),
      );
    }
  }

  /// CACHE
  @override
  Future<List<Agent>> getAgentsFromCache() async {
    var isSynchronized = false;

    try {
      final result = _agentCacheOperation.getAll();

      if (result.isNotEmpty) {
        return result.map((e) => e.agent).toList();
      }
      isSynchronized = true;
      return await getAgentsFromRemote() ?? [];
    } catch (e) {
      if (e is NetworkError) {
        rethrow;
      }

      throw NetworkError(
        NetworkExceptions.defaultError(
            error: LocaleKeys.general_messages_somethingWentWrong.tr()),
      );
    } finally {
      if (!isSynchronized) {
        /// Cache invalidation
        unawaited(getAgentsFromRemote());
      }
    }
  }

  /// Save agents to cache
  void saveAgentsToCache(List<Agent> agents) {
    try {
      _agentCacheOperation
          .addAll(agents.map((e) => AgentCacheModel(agent: e)).toList());
    } catch (e) {
      throw NetworkError(
        NetworkExceptions.defaultError(
            error: LocaleKeys.general_messages_somethingWentWrong.tr()),
      );
    }
  }

  @override
  Future<Agent?> getAgentByIdFromCache({required String id}) async {
    try {
      final result = _agentCacheOperation.get(id);

      if (result != null) {
        return result.agent;
      }
      return await getAgentByIdFromRemote(id: id);
    } catch (e) {
      if (e is NetworkError) {
        rethrow;
      }

      throw NetworkError(
        NetworkExceptions.defaultError(
            error: LocaleKeys.general_messages_somethingWentWrong.tr()),
      );
    }
  }

  /// Clear cache
  Future<void> clearCache() async {
    try {
      await _agentCacheOperation.clear();
    } catch (e) {
      throw NetworkError(
        NetworkExceptions.defaultError(
            error: LocaleKeys.general_messages_somethingWentWrong.tr()),
      );
    }
  }
}
