import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_valorant_agents/app/app.bottomsheets.dart';
import 'package:flutter_valorant_agents/app/app.dialogs.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/cache/agent/abilities_cache_model.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_cache_model.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_role_cache_model.dart';
import 'package:flutter_valorant_agents/product/cache/agent/recruitment_data_cache_model.dart';
import 'package:flutter_valorant_agents/product/config/app_environment.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/agent/concrete/agent_repository.dart';
import 'package:flutter_valorant_agents/services/cache/product_cache_service.dart';
import 'package:stacked_services/stacked_services.dart';

@immutable
final class ApplicationInitialize {
  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _initialize();
  }

  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();

    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();

    /// Use portrait mode for app
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    _productEnvironment();

    await _productCacheService();

    _registerLocators();
  }

  static void _registerLocators() {
    /// Agent repository
    locator.registerFactory<IAgentRepository>(
      () => AgentRepository(
        agentCacheOperation: locator<ProductCacheService>().agentCacheOperation,
        productNetworkErrorManager: ProductNetworkErrorManager(
          context: StackedService.navigatorKey!.currentState!.context,
        ),
      ),
    );
  }

  static void _productEnvironment() {
    /// Setup application environment
    AppEnvironment.general();
  }

  static Future<void> _productCacheService() async {
    final _productCache = locator<ProductCacheService>();

    await _productCache.init();

    /// Register models
    ///

    /// Agent
    _productCache
      ..register<AgentCacheModel>(
        AgentCacheModel.empty(),
        HiveAdapterId.agent,
      )
      ..register<AgentRoleCacheModel>(
        AgentRoleCacheModel.empty(),
        HiveAdapterId.agentRole,
      )
      ..register<RecruitmentDataCacheModel>(
        RecruitmentDataCacheModel.empty(),
        HiveAdapterId.recruitmentData,
      )
      ..register<AbilitiesCacheModel>(
        AbilitiesCacheModel.empty(),
        HiveAdapterId.ability,
      );

    /// Open cache box
    await _productCache.agentCacheOperation.open();
    await _productCache.agentRoleCacheOperation.open();
    await _productCache.recruitmentDataCacheOperation.open();
    await _productCache.abilitiesCacheOperation.open();
  }
}
