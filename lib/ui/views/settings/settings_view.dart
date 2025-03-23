// lib/ui/views/settings/settings_view.dart

import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/app/app.locator.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/extension/double_extension.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/utility/constants/enum/locales.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/product/widget/images/img_english.dart';
import 'package:flutter_valorant_agents/product/widget/images/img_turkish.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:flutter_valorant_agents/ui/styles/radiuses.dart';
import 'package:flutter_valorant_agents/ui/themes/theme_modes.dart';
import 'package:flutter_valorant_agents/ui/views/settings/settings_viewmodel.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

part 'widget/settings_view_title.dart';
part 'widget/settings_view_section_title.dart';
part 'widget/settings_view_divider.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        locator<NavigationService>()
            .back<bool>(result: viewModel.isLanguageChanged);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: viewModel.isBusy
              ? const SizedBox.shrink()
              : const _SettingsViewTitle(),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: viewModel.isBusy
                ? const LoadingCircular()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Select language
                      const _SettingsViewSectionTitle(
                          title: LocaleKeys.settings_language),
                      WidgetSizes.spacingM.h.height,
                      _buildLanguageOptions(context, viewModel),

                      // Divider
                      const _SettingsViewDivider(),

                      // Select theme
                      const _SettingsViewSectionTitle(
                          title: LocaleKeys.settings_theme),
                      WidgetSizes.spacingM.h.height,
                      _buildThemeOptions(context, viewModel),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOptions(
      BuildContext context, SettingsViewModel viewModel) {
    return Column(
      children: [
        _buildSettingsOption(
          context: context,
          isSelected: viewModel.isTurkish,
          onTap: () => viewModel.changeLanguage(Locales.tr, context: context),
          leading: ClipRRect(
            borderRadius: Radiuses.b2r,
            child: const ImgTurkish(),
          ),
          title: LocaleKeys.settings_turkish,
        ),
        WidgetSizes.spacingM.h.height,
        _buildSettingsOption(
          context: context,
          isSelected: !viewModel.isTurkish,
          onTap: () => viewModel.changeLanguage(Locales.en, context: context),
          leading: ClipRRect(
            borderRadius: Radiuses.b4r,
            child: const ImgEnglish(),
          ),
          title: LocaleKeys.settings_english,
        ),
      ],
    );
  }

  Widget _buildThemeOptions(BuildContext context, SettingsViewModel viewModel) {
    return Column(
      children: [
        _buildSettingsOption(
          context: context,
          isSelected: viewModel.isLightTheme,
          onTap: () => viewModel.changeTheme(AppThemeMode.light),
          leading: Icon(
            Icons.light_mode,
            size: 24.r,
          ),
          title: LocaleKeys.settings_light,
        ),
        SizedBox(height: 16.h),
        _buildSettingsOption(
          isSelected: !viewModel.isLightTheme,
          onTap: () => viewModel.changeTheme(AppThemeMode.dark),
          leading: Icon(
            Icons.dark_mode,
            size: 24.r,
          ),
          title: LocaleKeys.settings_dark,
          context: context,
        ),
      ],
    );
  }

  Widget _buildSettingsOption({
    required bool isSelected,
    required VoidCallback onTap,
    required Widget leading,
    required String title,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: Paddings.p16a,
        decoration: BoxDecoration(
          color: ColorName.crimsonRed.withValues(alpha: 0.05),
          borderRadius: Radiuses.b16r,
          border: Border.all(
            color: isSelected ? ColorName.crimsonRed : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            leading,
            WidgetSizes.spacingM.w.width,
            Expanded(
              child: Text(
                title,
                style: context.textTheme.bodyLarge,
              ).tr(),
            ),
            if (isSelected)
              Container(
                padding: Paddings.p2a,
                decoration: BoxDecoration(
                  color: ColorName.crimsonRed.withValues(alpha: 0.1),
                  borderRadius: Radiuses.b8r,
                ),
                child: Icon(
                  Icons.check,
                  color: ColorName.crimsonRed,
                  size: 16.r,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) {
    final viewModel = SettingsViewModel()
      ..localizationControl(context)
      ..themeControl();
    return viewModel;
  }
}
