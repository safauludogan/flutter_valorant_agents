import 'dart:async';

import 'package:flutter_valorant_agents/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    unawaited(_navigationService.replaceWithHomeView());
  }
}
