import 'package:core/core.dart';
import 'package:dio_nexus/dio_nexus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_valorant_agents/product/cache/favorite/favorite_agent_cache_model.dart';
import 'package:flutter_valorant_agents/product/extension/string_extension.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:gen/gen.dart';

@immutable
final class FavoriteAgentRepository implements IFavoriteAgentRepository {
  FavoriteAgentRepository(
      {required HiveCacheOperation<FavoriteAgentCacheModel>
          favoriteAgentCacheOperation})
      : _favoriteAgentCacheOperation = favoriteAgentCacheOperation;

  final HiveCacheOperation<FavoriteAgentCacheModel>
      _favoriteAgentCacheOperation;

  @override
  bool addFavoriteAgent({required FavoriteAgent favoriteAgent}) {
    try {
      final currentFavorites = getFavoriteAgents();

      for (final favorite in currentFavorites) {
        if (favorite.title?.trim() == favoriteAgent.title?.trim()) {
          throw Exception(LocaleKeys
              .general_favorite_messages_favoriteTitleAlreadyExists
              .tr());
        }
        if (favorite.agentId?.compareUuid(favoriteAgent.agentId) ?? true) {
          throw Exception(LocaleKeys
              .general_favorite_messages_favoriteAgentAlreadyExistsInFavorites
              .tr());
        }
      }

      _favoriteAgentCacheOperation
          .add(FavoriteAgentCacheModel(favoriteAgent: favoriteAgent));

      return true;
    } catch (e) {
      CustomLogger(data: 'Error').show();
      rethrow;
    }
  }

  @override
  bool removeFavoriteAgent({required String agentId}) {
    try {
      _favoriteAgentCacheOperation.remove(agentId);
      return true;
    } catch (e) {
      CustomLogger(data: 'Error').show();
      return false;
    }
  }

  @override
  bool updateFavoriteAgent({required FavoriteAgent favoriteAgent}) {
    try {
      final currentFavorites = getFavoriteAgents();

      for (final favorite in currentFavorites) {
        if (!favorite.agentId!.compareUuid(favoriteAgent.agentId) &&
            favorite.title?.trim() == favoriteAgent.title?.trim()) {
          throw Exception(LocaleKeys
              .general_favorite_messages_favoriteTitleAlreadyExists
              .tr());
        }
      }
      _favoriteAgentCacheOperation
          .update(FavoriteAgentCacheModel(favoriteAgent: favoriteAgent));

      return true;
    } catch (e) {
      CustomLogger(data: 'Error').show();
      rethrow;
    }
  }

  @override
  List<FavoriteAgent> getFavoriteAgents() {
    try {
      final favorites = _favoriteAgentCacheOperation.getAll();
      return favorites.map((e) => e.favoriteAgent).toList();
    } catch (e) {
      CustomLogger(data: 'Error').show();
    }
    return [];
  }

  @override
  Future<void> clearFavoriteAgents() async {
    try {
      await _favoriteAgentCacheOperation.clear();
    } catch (e) {
      CustomLogger(data: 'Error').show();
    }
  }

  @override
  FavoriteAgent? getFavoriteAgent({required String agentId}) {
    try {
      return _favoriteAgentCacheOperation.get(agentId)?.favoriteAgent;
    } catch (e) {
      CustomLogger(data: 'Error').show();
    }
    return null;
  }
}
