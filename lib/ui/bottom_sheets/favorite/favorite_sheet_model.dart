import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:stacked/stacked.dart';

class FavoriteSheetModel extends BaseViewModel {
  final _favoriteAgentRepository = locator<IFavoriteAgentRepository>();
}
