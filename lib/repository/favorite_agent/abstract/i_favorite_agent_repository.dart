import 'package:gen/gen.dart';

abstract class IFavoriteAgentRepository {
  /// Get favorite agent
  Future<bool> addFavoriteAgent({required FavoriteAgent favoriteAgent});
  void updateFavoriteAgent({required FavoriteAgent favoriteAgent});
  void removeFavoriteAgent({required String agentId});
  List<FavoriteAgent> getFavoriteAgents();
}
