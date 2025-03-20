import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/services/app/localization_service.dart';
import 'package:flutter_valorant_agents/services/app/theme_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:flutter_valorant_agents/services/api/agent_service.dart';
import 'package:flutter_valorant_agents/services/manager/product_network_service.dart';
import 'package:flutter_valorant_agents/services/common/toast_service.dart';
import 'package:flutter_valorant_agents/services/cache/product_cache_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<LocalizationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ThemeService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AgentService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ProductNetworkService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ToastService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ProductCacheService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
  ],
)
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterLocalizationService();
  getAndRegisterThemeService();
  getAndRegisterAgentService();
  getAndRegisterProductNetworkService();
  getAndRegisterToastService();
  getAndRegisterProductCacheService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(
    service.showCustomSheet<T, T>(
      enableDrag: anyNamed('enableDrag'),
      enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
      exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
      ignoreSafeArea: anyNamed('ignoreSafeArea'),
      isScrollControlled: anyNamed('isScrollControlled'),
      barrierDismissible: anyNamed('barrierDismissible'),
      additionalButtonTitle: anyNamed('additionalButtonTitle'),
      variant: anyNamed('variant'),
      title: anyNamed('title'),
      hasImage: anyNamed('hasImage'),
      imageUrl: anyNamed('imageUrl'),
      showIconInMainButton: anyNamed('showIconInMainButton'),
      mainButtonTitle: anyNamed('mainButtonTitle'),
      showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
      secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
      showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
      takesInput: anyNamed('takesInput'),
      barrierColor: anyNamed('barrierColor'),
      barrierLabel: anyNamed('barrierLabel'),
      customData: anyNamed('customData'),
      data: anyNamed('data'),
      description: anyNamed('description'),
    ),
  ).thenAnswer(
    (realInvocation) =>
        Future.value(showCustomSheetResponse ?? SheetResponse<T>()),
  );

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockLocalizationService getAndRegisterLocalizationService() {
  _removeRegistrationIfExists<LocalizationService>();
  final service = MockLocalizationService();
  locator.registerSingleton<LocalizationService>(service);
  return service;
}

MockThemeService getAndRegisterThemeService() {
  _removeRegistrationIfExists<ThemeService>();
  final service = MockThemeService();
  locator.registerSingleton<ThemeService>(service);
  return service;
}

MockAgentService getAndRegisterAgentService() {
  _removeRegistrationIfExists<AgentService>();
  final service = MockAgentService();
  locator.registerSingleton<AgentService>(service);
  return service;
}

MockProductNetworkService getAndRegisterProductNetworkService() {
  _removeRegistrationIfExists<ProductNetworkService>();
  final service = MockProductNetworkService();
  locator.registerSingleton<ProductNetworkService>(service);
  return service;
}

MockToastService getAndRegisterToastService() {
  _removeRegistrationIfExists<ToastService>();
  final service = MockToastService();
  locator.registerSingleton<ToastService>(service);
  return service;
}

MockProductCacheService getAndRegisterProductCacheService() {
  _removeRegistrationIfExists<ProductCacheService>();
  final service = MockProductCacheService();
  locator.registerSingleton<ProductCacheService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
