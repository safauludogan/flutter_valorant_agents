import 'package:dio_nexus/dio_nexus.dart';

/// Custom Network Error Exception
class NetworkError implements Exception {
  NetworkError(this.networkException);
  final NetworkExceptions networkException;

  @override
  String toString() => networkException.toString();
}
