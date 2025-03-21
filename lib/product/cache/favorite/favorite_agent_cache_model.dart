import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable
final class FavoriteAgentCacheModel with CacheModel<FavoriteAgentCacheModel> {
  const FavoriteAgentCacheModel({required this.favoriteAgent});

  /// Empty favorite agent cache model
  FavoriteAgentCacheModel.empty() : favoriteAgent = FavoriteAgent();

  /// FavoriteAgent
  final FavoriteAgent favoriteAgent;

  @override
  FavoriteAgentCacheModel fromJson(Map<String, dynamic> json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      throw Exception('Json cannot be null');
    }
    return copyWith(favoriteAgent: FavoriteAgent.fromJson(jsonMap));
  }

  @override
  Map<String, dynamic> toJson() => favoriteAgent.toJson();

  FavoriteAgentCacheModel copyWith({FavoriteAgent? favoriteAgent}) {
    return FavoriteAgentCacheModel(
        favoriteAgent: favoriteAgent ?? this.favoriteAgent);
  }

  @override
  String get cacheId => favoriteAgent.agentId ?? '';
}
