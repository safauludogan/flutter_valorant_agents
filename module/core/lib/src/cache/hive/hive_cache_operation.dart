import 'package:core/core.dart';
import 'package:hive/hive.dart';

part '../core/cache_manager_mixin.dart';

/// The HiveCacheOperation class is an
/// implementation of the CacheOperation class.
class HiveCacheOperation<T extends CacheModel<T>> extends CacheOperation<T>
    with CacheManagerMixin<T> {
  /// Initialize hive box

  @override
  void add(T item) {
    _box?.put(item.cacheId, item);
  }

  @override
  void addAll(List<T> items) {
    final map = <String, T>{
      for (final item in items) item.cacheId: item,
    };
    _box?.putAll(map);
  }

  @override
  void update(T item) {
    _box?.put(item.cacheId, item);
  }

  @override
  T? get(String id) {
    return _box?.get(id);
  }

  @override
  List<T> getAll() {
    return _box?.values.cast<T>().toList() ?? [];
  }

  @override
  void remove(String id) {
    _box?.delete(id);
  }
}
