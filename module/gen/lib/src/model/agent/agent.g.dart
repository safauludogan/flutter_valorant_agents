// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
  uuid: json['uuid'] as String?,
  displayName: json['displayName'] as String?,
  description: json['description'] as String?,
  developerName: json['developerName'] as String?,
  releaseDate: json['releaseDate'] as String?,
  characterTags:
      (json['characterTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  displayIcon: json['displayIcon'] as String?,
  bustPortrait: json['bustPortrait'] as String?,
  fullPortrait: json['fullPortrait'] as String?,
  fullPortraitV2: json['fullPortraitV2'] as String?,
  killfeedPortrait: json['killfeedPortrait'] as String?,
  background: json['background'] as String?,
  backgroundGradientColors:
      (json['backgroundGradientColors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  assetPath: json['assetPath'] as String?,
  isFullPortraitRightFacing: json['isFullPortraitRightFacing'] as bool?,
  isPlayableCharacter: json['isPlayableCharacter'] as bool?,
  isAvailableForTest: json['isAvailableForTest'] as bool?,
  isBaseContent: json['isBaseContent'] as bool?,
  role:
      json['role'] == null
          ? null
          : AgentRole.fromJson(json['role'] as Map<String, dynamic>),
  recruitmentData:
      json['recruitmentData'] == null
          ? null
          : RecruitmentData.fromJson(
            json['recruitmentData'] as Map<String, dynamic>,
          ),
  abilities:
      (json['abilities'] as List<dynamic>?)
          ?.map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'displayName': instance.displayName,
  'description': instance.description,
  'developerName': instance.developerName,
  'releaseDate': instance.releaseDate,
  'characterTags': instance.characterTags,
  'displayIcon': instance.displayIcon,
  'bustPortrait': instance.bustPortrait,
  'fullPortrait': instance.fullPortrait,
  'fullPortraitV2': instance.fullPortraitV2,
  'killfeedPortrait': instance.killfeedPortrait,
  'background': instance.background,
  'backgroundGradientColors': instance.backgroundGradientColors,
  'assetPath': instance.assetPath,
  'isFullPortraitRightFacing': instance.isFullPortraitRightFacing,
  'isPlayableCharacter': instance.isPlayableCharacter,
  'isAvailableForTest': instance.isAvailableForTest,
  'isBaseContent': instance.isBaseContent,
  'role': instance.role,
  'recruitmentData': instance.recruitmentData,
  'abilities': instance.abilities,
};
