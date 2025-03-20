import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'agent_role.g.dart';

@immutable
@JsonSerializable()
final class AgentRole extends IDioNexusNetworkModel<AgentRole>
    with EquatableMixin {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  AgentRole({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  @override
  AgentRole fromJson(Map<String, dynamic> json) => AgentRole.fromJson(json);

  factory AgentRole.fromJson(Map<String, dynamic> json) =>
      _$AgentRoleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AgentRoleToJson(this);

  @override
  List<Object?> get props => [
    uuid,
    displayName,
    description,
    displayIcon,
    assetPath,
  ];

  AgentRole copyWith({
    String? uuid,
    String? displayName,
    String? description,
    String? displayIcon,
    String? assetPath,
  }) {
    return AgentRole(
      uuid: uuid ?? this.uuid,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      displayIcon: displayIcon ?? this.displayIcon,
      assetPath: assetPath ?? this.assetPath,
    );
  }

  @override
  String toString() {
    return 'AgentRole(uuid: $uuid, displayName: $displayName, description: $description, displayIcon: $displayIcon, assetPath: $assetPath)';
  }
}
