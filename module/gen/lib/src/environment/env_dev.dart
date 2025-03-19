import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'env_dev.g.dart';

@Envied(obfuscate: true, path: 'assets/env/.dev.env')
/// Dev environment variables
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @override
  String get baseUrl => _baseUrl;
}
