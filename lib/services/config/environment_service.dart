import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

class EnvironmentService {
  EnvironmentService();

  /// Setup application environment required initialize
  EnvironmentService.setup({required AppConfiguration config}) {
    _config = config;
  }

  /// General application environment setup
  void general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }

  static late final AppConfiguration _config;

  /// Network base url
  String get baseUrl => _config.baseUrl;
}

/// Get application environment items
enum AppEnvironmentItems {
  /// Network base url
  baseUrl;

  /// Get application environment item value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return EnvironmentService._config.baseUrl;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialized');
    }
  }
}
