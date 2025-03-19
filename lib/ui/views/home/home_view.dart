import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/locales.dart';
import 'package:flutter_valorant_agents/ui/common/app_colors.dart';
import 'package:flutter_valorant_agents/ui/common/ui_helpers.dart';
import 'package:flutter_valorant_agents/ui/styles/text_styles.dart';
import 'package:flutter_valorant_agents/ui/themes/theme_modes.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getAgents();
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    Text(
                      'Hello, STACKED!',
                      style: AppTextStyles.headline1,
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () =>
                          viewModel.changeLanguage(context, Locales.tr),
                      child: const Text(
                        LocaleKeys.appName,
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                    ),
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () =>
                          viewModel.updateThemeMode(AppThemeMode.light),
                      child: const Text(
                        'Light tema',
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                    ),
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () =>
                          viewModel.updateThemeMode(AppThemeMode.dark),
                      child: const Text(
                        'Dark tema',
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showDialog,
                      child: const Text(
                        'Show Dialog',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showBottomSheet,
                      child: const Text(
                        'Show Bottom Sheet',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
