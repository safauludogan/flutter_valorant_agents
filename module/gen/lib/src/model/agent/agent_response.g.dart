// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentResponse _$AgentResponseFromJson(Map<String, dynamic> json) =>
    AgentResponse(
      status: (json['status'] as num?)?.toInt(),
      agentRoles:
          (json['data'] as List<dynamic>?)
              ?.map((e) => AgentRole.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$AgentResponseToJson(AgentResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.agentRoles};
