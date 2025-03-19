///Project service path
enum ProductServicePath {
  agents(_agents);

  final String value;
  const ProductServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }

  /// Api UserProfile name
  static const String _agents = 'agents/';
}
