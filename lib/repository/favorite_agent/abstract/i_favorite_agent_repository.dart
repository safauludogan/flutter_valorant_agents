import 'package:gen/gen.dart';

abstract class IFavoriteAgentRepository {
  /// Get favorite agent

  bool addFavoriteAgent({required FavoriteAgent favoriteAgent});
  bool updateFavoriteAgent({required FavoriteAgent favoriteAgent});
  bool removeFavoriteAgent({required String agentId});
  List<FavoriteAgent> getFavoriteAgents();
  FavoriteAgent? getFavoriteAgent({required String agentId});
  Future<void> clearFavoriteAgents();
}
