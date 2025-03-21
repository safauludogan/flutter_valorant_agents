import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable
final class AbilitiesCacheModel with CacheModel<AbilitiesCacheModel> {
  const AbilitiesCacheModel({
    required this.abilities,
  });

  /// Empty abilities cache model
  AbilitiesCacheModel.empty() : abilities = Abilities();

  /// Abilities
  final Abilities abilities;

  @override
  AbilitiesCacheModel fromJson(Map<String, dynamic> json) {
    final jsonString = json['data'] as String?;
    if (jsonString == null) {
      throw Exception('Json data cannot be null');
    }
    final abilitiesJson = jsonDecode(jsonString) as Map<String, dynamic>;
    return AbilitiesCacheModel(
      abilities: Abilities.fromJson(abilitiesJson),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'data': jsonEncode(abilities.toJson()),
      };

  AbilitiesCacheModel copyWith({
    Abilities? abilities,
  }) {
    return AbilitiesCacheModel(
      abilities: abilities ?? this.abilities,
    );
  }

  @override
  String get cacheId => abilities.slot ?? '';
}
