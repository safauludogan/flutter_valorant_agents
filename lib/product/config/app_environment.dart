import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

/// Application environment manager class
final class AppEnvironment {
  /// Setup application environment required initialize
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  /// General application environment setup
  AppEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }

  static late final AppConfiguration _config;

  /// Network base url
  static String get baseUrl => _config.baseUrl;
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
          return AppEnvironment._config.baseUrl;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialized');
    }
  }
}
