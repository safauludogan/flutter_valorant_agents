import 'package:gen/gen.dart';

abstract class IAgentRepository {
  /// API
  Future<List<Agent>?> getAgentsFromRemote();

  /// CACHE
  Future<List<Agent>> getAgentsFromCache();
}
