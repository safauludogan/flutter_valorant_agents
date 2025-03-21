import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gen/src/model/agent/abilities.dart';
import 'package:gen/src/model/agent/agent_role.dart';
import 'package:gen/src/model/agent/recruitment_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agent.g.dart';

@immutable
@JsonSerializable()
final class Agent extends IDioNexusNetworkModel<Agent> with EquatableMixin {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  String? releaseDate;
  List<String>? characterTags;
  String? displayIcon;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  @JsonKey(fromJson: _agentRoleFromJson, toJson: _agentRoleToJson)
  AgentRole? role;
  @JsonKey(fromJson: _recruitmentDataFromJson, toJson: _recruitmentDataToJson)
  RecruitmentData? recruitmentData;
  @JsonKey(fromJson: _abilitiesFromJson, toJson: _abilitiesToJson)
  List<Abilities>? abilities;

  Agent({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.releaseDate,
    this.characterTags,
    this.displayIcon,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.recruitmentData,
    this.abilities,
  });

  @override
  Agent fromJson(Map<String, dynamic> json) => Agent.fromJson(json);

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AgentToJson(this);

  @override
  List<Object?> get props => [
    uuid,
    displayName,
    description,
    developerName,
    releaseDate,
    characterTags,
    displayIcon,
    bustPortrait,
    fullPortrait,
    fullPortraitV2,
    killfeedPortrait,
    background,
    backgroundGradientColors,
    assetPath,
    isFullPortraitRightFacing,
    isPlayableCharacter,
    isAvailableForTest,
    isBaseContent,
    role,
    recruitmentData,
    abilities,
  ];

  Agent copyWith({
    String? uuid,
    String? displayName,
    String? description,
    String? developerName,
    String? releaseDate,
    List<String>? characterTags,
    String? displayIcon,
    String? bustPortrait,
    String? fullPortrait,
    String? fullPortraitV2,
    String? killfeedPortrait,
    String? background,
    List<String>? backgroundGradientColors,
    String? assetPath,
    bool? isFullPortraitRightFacing,
    bool? isPlayableCharacter,
    bool? isAvailableForTest,
    bool? isBaseContent,
    AgentRole? role,
    RecruitmentData? recruitmentData,
    List<Abilities>? abilities,
  }) {
    return Agent(
      uuid: uuid ?? this.uuid,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      developerName: developerName ?? this.developerName,
      releaseDate: releaseDate ?? this.releaseDate,
      characterTags: characterTags ?? this.characterTags,
      displayIcon: displayIcon ?? this.displayIcon,
      bustPortrait: bustPortrait ?? this.bustPortrait,
      fullPortrait: fullPortrait ?? this.fullPortrait,
      fullPortraitV2: fullPortraitV2 ?? this.fullPortraitV2,
      killfeedPortrait: killfeedPortrait ?? this.killfeedPortrait,
      background: background ?? this.background,
      backgroundGradientColors:
          backgroundGradientColors ?? this.backgroundGradientColors,
      assetPath: assetPath ?? this.assetPath,
      isFullPortraitRightFacing:
          isFullPortraitRightFacing ?? this.isFullPortraitRightFacing,
      isPlayableCharacter: isPlayableCharacter ?? this.isPlayableCharacter,
      isAvailableForTest: isAvailableForTest ?? this.isAvailableForTest,
      isBaseContent: isBaseContent ?? this.isBaseContent,
      role: role ?? this.role,
      recruitmentData: recruitmentData ?? this.recruitmentData,
      abilities: abilities ?? this.abilities,
    );
  }

  @override
  String toString() {
    return 'Agent(uuid: $uuid, displayName: $displayName, description: $description, developerName: $developerName, releaseDate: $releaseDate, characterTags: $characterTags, displayIcon: $displayIcon, bustPortrait: $bustPortrait, fullPortrait: $fullPortrait, fullPortraitV2: $fullPortraitV2, killfeedPortrait: $killfeedPortrait, background: $background, backgroundGradientColors: $backgroundGradientColors, assetPath: $assetPath, isFullPortraitRightFacing: $isFullPortraitRightFacing, isPlayableCharacter: $isPlayableCharacter, isAvailableForTest: $isAvailableForTest, isBaseContent: $isBaseContent, role: $role, recruitmentData: $recruitmentData, abilities: $abilities)';
  }

  static AgentRole? _agentRoleFromJson(Map<String, dynamic> json) {
    if (json['uuid'] == null) return null;
    return AgentRole.fromJson(json);
  }

  static Map<String, dynamic> _agentRoleToJson(AgentRole? role) {
    if (role == null) return {};
    return role.toJson();
  }

  static List<Abilities>? _abilitiesFromJson(List<dynamic> json) {
    if (json.isEmpty) return null;
    return json
        .map((e) => Abilities.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> _abilitiesToJson(
    List<Abilities>? abilities,
  ) {
    return abilities?.map((e) => e.toJson()).toList() ?? [];
  }

  static RecruitmentData? _recruitmentDataFromJson(Map<String, dynamic> json) {
    if (json['uuid'] == null) return null;
    return RecruitmentData.fromJson(json);
  }

  static Map<String, dynamic> _recruitmentDataToJson(
    RecruitmentData? recruitmentData,
  ) {
    if (recruitmentData == null) return {};
    return recruitmentData.toJson();
  }
}
