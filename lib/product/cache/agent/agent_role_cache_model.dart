import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable
final class AgentRoleCacheModel with CacheModel<AgentRoleCacheModel> {
  const AgentRoleCacheModel({
    required this.role,
  });

  /// Empty agent role cache model
  AgentRoleCacheModel.empty() : role = AgentRole();

  /// Agent role
  final AgentRole role;

  @override
  AgentRoleCacheModel fromJson(Map<String, dynamic> json) {
    final jsonString = json['data'] as String?;
    if (jsonString == null) {
      throw Exception('Json data cannot be null');
    }
    final roleJson = jsonDecode(jsonString) as Map<String, dynamic>;
    return AgentRoleCacheModel(
      role: AgentRole.fromJson(roleJson),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'data': jsonEncode(role.toJson()),
      };

  AgentRoleCacheModel copyWith({
    AgentRole? role,
  }) {
    return AgentRoleCacheModel(
      role: role ?? this.role,
    );
  }

  @override
  String get cacheId => role.uuid ?? '';
}
