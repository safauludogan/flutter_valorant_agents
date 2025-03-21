part of '../add_favorite_sheet.dart';

class _DescriptionTextform extends StatelessWidget {
  const _DescriptionTextform({
    super.key,
    required this.descriptionInputController,
    required this.descriptionInputError,
    required this.isValidate,
  });

  /// Description input controller
  final TextEditingController descriptionInputController;

  /// Description input error
  final String? descriptionInputError;

  /// Is validate
  final bool isValidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MultilineTextfield(
          controller: descriptionInputController,
          hintText: LocaleKeys.general_textformfield_hintText_description.tr(),
          maxLength: 100,
        ),
        verticalSpaceTiny,
        if (isValidate)
          Text(
            descriptionInputError!,
            style: AppTextStyles.small
                .copyWith(color: Theme.of(context).colorScheme.error),
          ),
      ],
    );
  }
}
