// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecruitmentData _$RecruitmentDataFromJson(Map<String, dynamic> json) =>
    RecruitmentData(
      counterId: json['counterId'] as String?,
      milestoneId: json['milestoneId'] as String?,
      milestoneThreshold: (json['milestoneThreshold'] as num?)?.toInt(),
      useLevelVpCostOverride: json['useLevelVpCostOverride'] as bool?,
      levelVpCostOverride: (json['levelVpCostOverride'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$RecruitmentDataToJson(RecruitmentData instance) =>
    <String, dynamic>{
      'counterId': instance.counterId,
      'milestoneId': instance.milestoneId,
      'milestoneThreshold': instance.milestoneThreshold,
      'useLevelVpCostOverride': instance.useLevelVpCostOverride,
      'levelVpCostOverride': instance.levelVpCostOverride,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
