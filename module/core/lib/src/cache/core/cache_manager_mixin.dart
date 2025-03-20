part of '../hive/hive_cache_operation.dart';


mixin CacheManagerMixin<T> {
  /// Hive box
  Box<T>? _box;

  /// Open before use the hive cache
  Future<void> open() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<T>(T.toString());
    }
  }

  Future<void> clear() => _box!.clear();
}
