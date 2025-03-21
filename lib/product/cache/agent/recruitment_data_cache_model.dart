import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable
final class RecruitmentDataCacheModel
    with CacheModel<RecruitmentDataCacheModel> {
  const RecruitmentDataCacheModel({
    required this.recruitmentData,
  });

  /// Empty recruitment data cache model
  RecruitmentDataCacheModel.empty() : recruitmentData = RecruitmentData();

  /// Recruitment data
  final RecruitmentData recruitmentData;

  @override
  RecruitmentDataCacheModel fromJson(Map<String, dynamic> json) {
    final jsonString = json['data'] as String?;
    if (jsonString == null) {
      throw Exception('Json data cannot be null');
    }
    final recruitmentDataJson = jsonDecode(jsonString) as Map<String, dynamic>;
    return RecruitmentDataCacheModel(
      recruitmentData: RecruitmentData.fromJson(recruitmentDataJson),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'data': jsonEncode(recruitmentData.toJson()),
      };

  RecruitmentDataCacheModel copyWith({
    RecruitmentData? recruitmentData,
  }) {
    return RecruitmentDataCacheModel(
      recruitmentData: recruitmentData ?? this.recruitmentData,
    );
  }

  @override
  String get cacheId => recruitmentData.counterId ?? '';
}
