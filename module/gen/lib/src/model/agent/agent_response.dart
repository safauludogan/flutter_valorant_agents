import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agent_response.g.dart';

@immutable
@JsonSerializable()
final class AgentResponse extends IDioNexusNetworkModel<AgentResponse>
    with EquatableMixin {
  int? status;
  @JsonKey(name: 'data')
  List<Agent>? agents;

  AgentResponse({this.status, this.agents});

  @override
  AgentResponse fromJson(Map<String, dynamic> json) =>
      AgentResponse.fromJson(json);

  factory AgentResponse.fromJson(Map<String, dynamic> json) =>
      _$AgentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AgentResponseToJson(this);

  @override
  List<Object?> get props => [status, agents];

  AgentResponse copyWith({int? status, List<Agent>? agents}) {
    return AgentResponse(
      status: status ?? this.status,
      agents: agents ?? this.agents,
    );
  }

  @override
  String toString() {
    return 'AgentResponse(status: $status, agents: $agents)';
  }
}
