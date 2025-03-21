import 'package:core/core.dart';
import 'package:flutter_valorant_agents/product/cache/agent/agent_cache_model.dart';
import 'package:flutter_valorant_agents/repository/agent/abstract/i_agent_repository.dart';
import 'package:flutter_valorant_agents/repository/agent/concrete/agent_repository.dart';
import 'package:flutter_valorant_agents/repository/favorite_agent/concrete/favorite_agent_repository.dart';
import 'package:flutter_valorant_agents/services/app/localization_service.dart';
import 'package:flutter_valorant_agents/services/app/theme_service.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter_valorant_agents/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:flutter_valorant_agents/ui/views/home/home_view.dart';
import 'package:flutter_valorant_agents/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_valorant_agents/services/api/agent/agent_service.dart';
import 'package:flutter_valorant_agents/services/manager/product_network_service.dart';
import 'package:flutter_valorant_agents/services/common/toast_service.dart';
import 'package:flutter_valorant_agents/services/cache/product_cache_service.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/favorite/favorite_sheet.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocalizationService),
    LazySingleton(classType: ThemeService),
    LazySingleton(classType: AgentService),
    LazySingleton(classType: ProductNetworkService),
    LazySingleton(classType: ToastService),
    LazySingleton(classType: ProductCacheService),

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: FavoriteSheet),
    StackedBottomsheet(classType: AddFavoriteSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
