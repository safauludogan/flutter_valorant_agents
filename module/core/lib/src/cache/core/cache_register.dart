import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/src/cache/hive/hive_adapter_id.dart';
import 'package:hive/hive.dart';

/// Hive register adapters manager
final class CacheRegisterAdapter<T extends CacheModel<T>>
    extends TypeAdapter<T> {
  CacheRegisterAdapter(this.fromJson, this.hiveAdapterId);

  ///fromJson for read data from cache and to model
  final T Function(Map<String, dynamic>) fromJson;

  /// Adapter unique id
  final HiveAdapterId hiveAdapterId;

  @override
  T read(BinaryReader reader) {
    final read = reader.read();
    final jsonConverted = jsonEncode(read);
    return fromJson(
      json.decode(jsonConverted) as Map<String, dynamic>,
    );
  }

  @override
  int get typeId => hiveAdapterId.value;

  @override
  void write(BinaryWriter writer, T obj) {
    writer.write(obj.toJson());
  }
}
