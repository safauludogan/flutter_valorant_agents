import 'dart:ui';

import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  /// Navigation
  Future<void> navigateToAgentDetail(
      String agentId, VoidCallback checkFavoriteAgent) async {
    await _navigationService.navigateToAgentDetailView(agentId: agentId);
    checkFavoriteAgent();
  }
}
