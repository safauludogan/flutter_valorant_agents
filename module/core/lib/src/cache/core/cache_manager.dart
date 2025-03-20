// The CacheManager class is an abstract class.

import 'package:core/core.dart';
import 'package:core/src/cache/hive/hive_adapter_id.dart';

/// Cache manager
abstract class CacheManager {
  CacheManager({this.path});

  /// Make your cache initialization here.
  Future<void> init();

  /// Remove all cache.
  Future<void> remove();

  /// Register cache models to [Hive]
  void register<T extends CacheModel<T>>(T model, HiveAdapterId hiveAdapterId);

  /// [path] is the path to the directory for example testing.
  final String? path;
}
