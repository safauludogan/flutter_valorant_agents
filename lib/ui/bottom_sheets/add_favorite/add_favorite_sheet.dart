import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/textfield/base/product_textfield.dart';
import 'package:flutter_valorant_agents/product/textfield/multiline_textfield.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/product/validator/validator_items.dart';
import 'package:flutter_valorant_agents/product/widget/button/icon_elevated_button.dart';
import 'package:flutter_valorant_agents/product/widget/button/normal_elevated_button.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet.form.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet_model.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/mixin/add_favorite_sheet_mixin.dart';
import 'package:flutter_valorant_agents/ui/common/app_colors.dart';
import 'package:flutter_valorant_agents/ui/common/ui_helpers.dart';
import 'package:flutter_valorant_agents/ui/styles/text_styles.dart';
import 'package:gen/gen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

part 'widget/description_textform.dart';
part 'widget/title_textform.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'titleInput',
      validator: ValidatorItems.validateFavoriteTitle,
    ),
    FormTextField(
      name: 'descriptionInput',
      validator: ValidatorItems.validateFavoriteDescription,
    ),
  ],
)
class AddFavoriteSheet extends StackedView<AddFavoriteSheetModel>
    with $AddFavoriteSheet, AddFavoriteSheetMixin {
  AddFavoriteSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  /// Completer
  final void Function(SheetResponse<bool> response)? completer;

  /// Request
  final SheetRequest<dynamic> request;

  @override
  void onViewModelReady(AddFavoriteSheetModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
    initializeControllers(request.data);
  }

  @override
  Widget builder(
    BuildContext context,
    AddFavoriteSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.bottomSheet_addFavorite_title.tr(),
                style: context.textTheme.bodyLarge,
              ),
              Text(
                LocaleKeys.favorite_messages_agentName
                    .tr(args: [request.title.toString()]),
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
          verticalSpaceSmall,
          _TitleTextform(
            titleInputController: titleInputController,
            titleInputError: viewModel.titleInputValidationMessage,
            isValidate: viewModel.hasTitleInputValidationMessage,
          ),
          verticalSpaceSmall,
          _DescriptionTextform(
            descriptionInputController: descriptionInputController,
            descriptionInputError: viewModel.descriptionInputValidationMessage,
            isValidate: viewModel.hasDescriptionInputValidationMessage,
          ),
          verticalSpaceTiny,
          if (isAddFavorite)
            Text(
              LocaleKeys.bottomSheet_addFavorite_description.tr(),
              style:
                  context.textTheme.titleSmall?.copyWith(color: kcMediumGrey),
              maxLines: 3,
              softWrap: true,
            ),
          if (isAddFavorite) verticalSpaceMedium,
          if (isAddFavorite)
            NormalElevatedButton(
              onPressed: () => viewModel.addFavorite(request.data as String),
              text: LocaleKeys.bottomSheet_addFavorite_mainButtonTitle.tr(),
            )
          else
            Column(
              spacing: WidgetSizes.spacingXSs,
              children: [
                NormalIconElevatedButton(
                  title: LocaleKeys.general_button_update.tr(),
                  onPressed: () => viewModel
                      .updateFavorite((request.data as FavoriteAgent).agentId!),
                  icon: const Icon(
                    Icons.update,
                    color: ColorName.white,
                  ),
                ),
                NormalIconElevatedButton(
                  title: LocaleKeys.general_button_delete.tr(),
                  bgColor: ColorName.crimsonRed,
                  onPressed: () => viewModel
                      .deleteFavorite((request.data as FavoriteAgent).agentId!),
                  icon: const Icon(
                    Icons.delete,
                    color: ColorName.white,
                  ),
                ),
              ],
            ),
          verticalSpaceMedium,
        ],
      ),
    );
  }

  @override
  AddFavoriteSheetModel viewModelBuilder(BuildContext context) =>
      AddFavoriteSheetModel();
}
