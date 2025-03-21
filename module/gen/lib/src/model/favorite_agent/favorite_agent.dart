import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_agent.g.dart';

@JsonSerializable()
@immutable
final class FavoriteAgent extends Equatable {
  String? agentId;
  String? title;
  String? description;

  FavoriteAgent({this.agentId, this.title, this.description});

  factory FavoriteAgent.fromJson(Map<String, dynamic> json) =>
      _$FavoriteAgentFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteAgentToJson(this);

  @override
  List<Object?> get props => [agentId, title, description];

  FavoriteAgent copyWith({
    String? agentId,
    String? title,
    String? description,
  }) {
    return FavoriteAgent(
      agentId: agentId ?? this.agentId,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'FavoriteAgent(agentId: $agentId, title: $title, description: $description)';
  }
}
