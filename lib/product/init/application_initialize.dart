import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_valorant_agents/app/app.bottomsheets.dart';
import 'package:flutter_valorant_agents/app/app.dialogs.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_response_cache_model.dart';
import 'package:flutter_valorant_agents/product/config/app_environment.dart';
import 'package:flutter_valorant_agents/services/cache/product_cache_service.dart';

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

    _productCacheService();
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

    /// Agent response
    _productCache.register<AgentResponseCacheModel>(
      AgentResponseCacheModel.empty(),
      HiveAdapterId.agentResponse,
    );

    /// Open cache box
    await _productCache.agentResponseCacheOperation.open();
  }
}
