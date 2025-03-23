import 'package:gen/gen.dart';

abstract class IAgentRepository {
  /// API
  Future<List<Agent>?> getAgentsFromRemote();
  Future<Agent?> getAgentByIdFromRemote({required String id});

  /// CACHE
  Future<List<Agent>> getAgentsFromCache();
  Future<Agent?> getAgentByIdFromCache({required String id});
  Future<void> clearCache();
}
