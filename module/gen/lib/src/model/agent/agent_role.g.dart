// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentRole _$AgentRoleFromJson(Map<String, dynamic> json) => AgentRole(
  uuid: json['uuid'] as String?,
  displayName: json['displayName'] as String?,
  description: json['description'] as String?,
  displayIcon: json['displayIcon'] as String?,
  assetPath: json['assetPath'] as String?,
);

Map<String, dynamic> _$AgentRoleToJson(AgentRole instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'displayName': instance.displayName,
  'description': instance.description,
  'displayIcon': instance.displayIcon,
  'assetPath': instance.assetPath,
};
