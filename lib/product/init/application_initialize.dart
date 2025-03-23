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
import 'package:flutter_valorant_agents/product/cache/favorite/favorite_agent_cache_model.dart';
import 'package:flutter_valorant_agents/product/config/app_environment.dart';
import 'package:flutter_valorant_agents/product/manager/product_network_error_manager.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/agent/concrete/agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/abstract/i_favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/concrete/favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/services/app/theme_service.dart';
import 'package:flutter_valorant_agents/services/cache/product_cache_service.dart';
import 'package:flutter_valorant_agents/services/cache/product_shared_cache_service.dart';
import 'package:flutter_valorant_agents/ui/themes/theme_modes.dart';
import 'package:stacked_services/stacked_services.dart';

@immutable
final class ApplicationInitialize {
  /// Setup application
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

    _setupTheme();
  }

  static void _registerLocators() {
    /// Agent repository
    locator
      ..registerLazySingleton<IAgentRepository>(
        () => AgentRepository(
          agentCacheOperation:
              locator<ProductCacheService>().agentCacheOperation,
          productNetworkErrorManager: ProductNetworkErrorManager(
            context: StackedService.navigatorKey!.currentState!.context,
          ),
        ),
      )

      /// Favorite agent repository
      ..registerLazySingleton<IFavoriteAgentRepository>(
        () => FavoriteAgentRepository(
          favoriteAgentCacheOperation:
              locator<ProductCacheService>().favoriteAgentCacheOperation,
        ),
      );
  }

  static void _productEnvironment() {
    /// Setup application environment
    AppEnvironment.general();
  }

  static Future<void> _productCacheService() async {
    final productSharedCacheService = locator<ProductSharedCacheService>();
    final productCache = locator<ProductCacheService>();

    await productCache.init();
    await productSharedCacheService.init();

    /// Register models
    ///

    /// Agent
    productCache
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
      )
      ..register<FavoriteAgentCacheModel>(
        FavoriteAgentCacheModel.empty(),
        HiveAdapterId.favoriteAgent,
      );

    /// Open cache box
    await productCache.agentCacheOperation.open();
    await productCache.agentRoleCacheOperation.open();
    await productCache.recruitmentDataCacheOperation.open();
    await productCache.abilitiesCacheOperation.open();
    await productCache.favoriteAgentCacheOperation.open();
  }

  static void _setupTheme() {
    final themeModeCache =
        locator<ProductSharedCacheService>().get<String>(SharedKeys.themeMode);

    locator<ThemeService>()
        .updateThemeMode(AppThemeMode.fromString(themeModeCache));
  }
}
