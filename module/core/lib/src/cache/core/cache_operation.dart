
import 'package:core/core.dart';

abstract class CacheOperation<T extends CacheModel<T>> {
  void add(T item);
  void addAll(List<T> items);
  void update(T item);
  void remove(String id);

  List<T> getAll();
  T? get(String id);
}
