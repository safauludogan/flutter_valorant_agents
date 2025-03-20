mixin CacheModel<T> {
  String get cacheId;
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
