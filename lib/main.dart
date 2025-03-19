import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/app/app.router.dart';
import 'package:flutter_valorant_agents/main_view_model.dart';
import 'package:flutter_valorant_agents/product/init/application_initialize.dart';
import 'package:flutter_valorant_agents/product/init/product_localization.dart';
import 'package:flutter_valorant_agents/ui/themes/app_themes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  await ApplicationInitialize().setup();

  runApp(ProductLocalization(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, viewModel, child) => MaterialApp(
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver],
        theme: viewModel.theme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
