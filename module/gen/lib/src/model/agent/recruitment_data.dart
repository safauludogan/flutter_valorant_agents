import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recruitment_data.g.dart';

@immutable
@JsonSerializable()
final class RecruitmentData extends IDioNexusNetworkModel<RecruitmentData>
    with EquatableMixin {
  String? counterId;
  String? milestoneId;
  int? milestoneThreshold;
  bool? useLevelVpCostOverride;
  int? levelVpCostOverride;
  String? startDate;
  String? endDate;

  RecruitmentData({
    this.counterId,
    this.milestoneId,
    this.milestoneThreshold,
    this.useLevelVpCostOverride,
    this.levelVpCostOverride,
    this.startDate,
    this.endDate,
  });

  @override
  RecruitmentData fromJson(Map<String, dynamic> json) =>
      RecruitmentData.fromJson(json);

  factory RecruitmentData.fromJson(Map<String, dynamic> json) =>
      _$RecruitmentDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecruitmentDataToJson(this);

  @override
  List<Object?> get props => [
    counterId,
    milestoneId,
    milestoneThreshold,
    useLevelVpCostOverride,
    levelVpCostOverride,
    startDate,
    endDate,
  ];

  RecruitmentData copyWith({
    String? counterId,
    String? milestoneId,
    int? milestoneThreshold,
    bool? useLevelVpCostOverride,
    int? levelVpCostOverride,
    String? startDate,
    String? endDate,
  }) {
    return RecruitmentData(
      counterId: counterId ?? this.counterId,
      milestoneId: milestoneId ?? this.milestoneId,
      milestoneThreshold: milestoneThreshold ?? this.milestoneThreshold,
      useLevelVpCostOverride:
          useLevelVpCostOverride ?? this.useLevelVpCostOverride,
      levelVpCostOverride: levelVpCostOverride ?? this.levelVpCostOverride,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  String toString() {
    return 'RecruitmentData(counterId: $counterId, milestoneId: $milestoneId, milestoneThreshold: $milestoneThreshold, useLevelVpCostOverride: $useLevelVpCostOverride, levelVpCostOverride: $levelVpCostOverride, startDate: $startDate, endDate: $endDate)';
  }
}
