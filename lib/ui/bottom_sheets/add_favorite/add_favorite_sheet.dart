import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/init/language/locale_keys.g.dart';
import 'package:flutter_valorant_agents/product/textfield/base/product_textfield.dart';
import 'package:flutter_valorant_agents/product/textfield/multiline_textfield.dart';
import 'package:flutter_valorant_agents/product/validator/validator_items.dart';
import 'package:flutter_valorant_agents/product/widget/button/normal_elevated_button.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/add_favorite_sheet.form.dart';
import 'package:flutter_valorant_agents/ui/bottom_sheets/add_favorite/mixin/add_favorite_sheet_mixin.dart';
import 'package:flutter_valorant_agents/ui/common/app_colors.dart';
import 'package:flutter_valorant_agents/ui/common/ui_helpers.dart';
import 'package:flutter_valorant_agents/ui/styles/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_favorite_sheet_model.dart';
part 'widget/title_textform.dart';
part 'widget/description_textform.dart';

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
  final Function(SheetResponse response)? completer;

  /// Request
  final SheetRequest request;

  @override
  Widget builder(
    BuildContext context,
    AddFavoriteSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.general_bottomSheet_addFavorite_title.tr(),
              style: AppTextStyles.bodyText1,
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
              descriptionInputError:
                  viewModel.descriptionInputValidationMessage,
              isValidate: viewModel.hasDescriptionInputValidationMessage,
            ),
            verticalSpaceTiny,
            Text(
              LocaleKeys.general_bottomSheet_addFavorite_description.tr(),
              style: AppTextStyles.small
                  .copyWith(fontSize: 12, color: kcMediumGrey),
              maxLines: 3,
              softWrap: true,
            ),
            verticalSpaceMedium,
            NormalElevatedButton(
              onPressed: () => viewModel.addFavorite(request.data as String),
              text: LocaleKeys.general_bottomSheet_addFavorite_mainButtonTitle
                  .tr(),
            ),
            verticalSpaceMedium
          ],
        ),
      ),
    );
  }

  @override
  AddFavoriteSheetModel viewModelBuilder(BuildContext context) =>
      AddFavoriteSheetModel();
}
