import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'abilities.g.dart';

@immutable
@JsonSerializable()
final class Abilities extends IDioNexusNetworkModel<Abilities>
    with EquatableMixin {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  @override
  Abilities fromJson(Map<String, dynamic> json) => Abilities.fromJson(json);

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);

  @override
  List<Object?> get props => [slot, displayName, description, displayIcon];

  Abilities copyWith({
    String? slot,
    String? displayName,
    String? description,
    String? displayIcon,
  }) {
    return Abilities(
      slot: slot ?? this.slot,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      displayIcon: displayIcon ?? this.displayIcon,
    );
  }
}
