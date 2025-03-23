import 'dart:async';

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/app/app.bottomsheets.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/manager/network_error.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentDetailViewModel extends BaseViewModel {
  final _agentRepository = locator<IAgentRepository>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _favoriteAgentRepository = locator<IFavoriteAgentRepository>();

  /// Agent
  Agent? get agent => _agent;
  Agent? _agent;

  /// Network error
  NetworkExceptions? _error;
  NetworkExceptions? get getError => _error;

  /// Scroll opacity
  double _opacity = 0;
  double get opacity => _opacity;

  bool isFavorite = false;

  /// Scroll controller
  late ScrollController scrollController;

  /// Get agent
  Future<void> getAgent({required String agentId}) async {
    isAgentFavorite(agentId: agentId);
    setBusy(true);
    _error = null;
    try {
      _agent = await _agentRepository.getAgentByIdFromCache(id: agentId);
    } on NetworkError catch (e) {
      _error = e.networkException;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setBusy(false);
    }
  }

  /// Initialize
  void initialize() {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.hasClients) {
          updateOpacity(scrollController.offset);
        }
      });
  }

  /// Is agent favorite
  void isAgentFavorite({required String agentId}) {
    isFavorite =
        _favoriteAgentRepository.getFavoriteAgent(agentId: agentId) != null;
    rebuildUi();
  }

  /// Update opacity
  void updateOpacity(double offset) {
    _opacity = scrollController.offset > 460.h ? 1.0 : 0.0;
    rebuildUi();
  }

  /// On favorite tap
  Future<void> onFavoriteTap(Agent agent) async {
    if (!isFavorite) {
      await _addFavoriteAgent(agent);
    } else {
      await _removeOrUpdateFavoriteAgent(agent);
    }
  }

  Future<void> _addFavoriteAgent(Agent agent) async {
    final response = await _bottomSheetService.showCustomSheet<bool, String>(
        variant: BottomSheetType.addFavorite,
        isScrollControlled: true,
        title: agent.displayName,
        data: agent.uuid);
    if (response?.data ?? false) {
      isAgentFavorite(agentId: agent.uuid!);
      rebuildUi();
    }
  }

  Future<void> _removeOrUpdateFavoriteAgent(Agent agent) async {
    final favoriteAgent =
        _favoriteAgentRepository.getFavoriteAgent(agentId: agent.uuid!);

    final response =
        await _bottomSheetService.showCustomSheet<bool, FavoriteAgent>(
            variant: BottomSheetType.addFavorite,
            isScrollControlled: true,
            title: agent.displayName,
            data: favoriteAgent);
    if (response?.data ?? false) {
      isAgentFavorite(agentId: agent.uuid!);
      rebuildUi();
    }
  }
}
