import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable
final class AgentCacheModel with CacheModel<AgentCacheModel> {
  const AgentCacheModel({
    required this.agent,
  });

  /// Empty agent cache model
  AgentCacheModel.empty() : agent = Agent();

  /// Agent
  final Agent agent;

  @override
  AgentCacheModel fromJson(Map<String, dynamic> json) {
    print('fromJson: $json');
    final jsonString = json['data'] as String?;
    if (jsonString == null) {
      throw Exception('Json data cannot be null');
    }
    final agentJson = jsonDecode(jsonString) as Map<String, dynamic>;
    return AgentCacheModel(
      agent: Agent.fromJson(agentJson),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'data': jsonEncode(agent.toJson()),
      };

  AgentCacheModel copyWith({
    Agent? agent,
  }) {
    return AgentCacheModel(
      agent: agent ?? this.agent,
    );
  }

  @override
  String get cacheId => agent.uuid ?? '';
}
