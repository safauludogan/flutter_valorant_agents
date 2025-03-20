// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentResponse _$AgentResponseFromJson(Map<String, dynamic> json) =>
    AgentResponse(
      status: (json['status'] as num?)?.toInt(),
      agents:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Agent.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$AgentResponseToJson(AgentResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.agents};
