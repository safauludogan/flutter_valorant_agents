import 'package:uuid/uuid.dart' as uuid;

extension StringExtension on String {
  /// Compare uuid
  bool compareUuid(String? other) {
    if (other == null || isEmpty || other.isEmpty) return false;
    return uuid.UuidValue.fromString(
      this,
    ).equals(uuid.UuidValue.fromString(other));
  }
}
