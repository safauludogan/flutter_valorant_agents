import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/locales.dart';
import 'package:stacked/stacked.dart';

class LocalizationService with ListenableServiceMixin {
  /// Change app language by using [Locales]
  void updateLanguage({
    required BuildContext context,
    required Locales value,
  }) {
    context.setLocale(value.locale);
    notifyListeners();
  }

  static String getCurrentLocale(BuildContext context) =>
      Localizations.localeOf(context).languageCode;
}

/*

class PostService with ListenableServiceMixin {
  PostService() {
    listenToReactiveValues([_postCount]);
  }

  int _postCount = 0;
  int get postCount => _postCount;

  Future<void> increment() async {
    _postCount++;
    notifyListeners(); // ViewModels listening postCount value are notified and their View is rebuild
  }



  class AnyViewModel extends ReactiveViewModel {
  final _postsService = locator<PostsService>();

  int get postCount => _postsService.postCount;

  @override
  List<ListenableServiceMixin> get listenableServices => [_postsService];
}
}*/
