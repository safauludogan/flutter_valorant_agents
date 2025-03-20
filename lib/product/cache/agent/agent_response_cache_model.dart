import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable
final class AgentResponseCacheModel with CacheModel<AgentResponseCacheModel> {
  const AgentResponseCacheModel({
    required this.agentResponse,
  });

  /// Empty agent response cache model
  AgentResponseCacheModel.empty() : agentResponse = AgentResponse();

  /// Agent response
  final AgentResponse agentResponse;

  @override
  AgentResponseCacheModel fromJson(Map<String, dynamic> json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      throw Exception('Json cannot be null $AgentResponse');
    }
    return copyWith(agentResponse: AgentResponse.fromJson(jsonMap));
  }

  @override
  Map<String, dynamic> toJson() => agentResponse.toJson();

  AgentResponseCacheModel copyWith({
    AgentResponse? agentResponse,
  }) {
    return AgentResponseCacheModel(
      agentResponse: agentResponse ?? this.agentResponse,
    );
  }

  @override
  String get cacheId => AgentResponseCacheModel.empty().toString();
}
