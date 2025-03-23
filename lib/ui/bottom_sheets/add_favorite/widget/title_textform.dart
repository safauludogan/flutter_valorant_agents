part of '../add_favorite_sheet.dart';

class _TitleTextform extends StatelessWidget {
  const _TitleTextform({
    super.key,
    required this.titleInputController,
    required this.titleInputError,
    required this.isValidate,
  });

  /// Title input controller
  final TextEditingController titleInputController;

  /// Title input error
  final String? titleInputError;

  /// Is validate
  final bool isValidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductTextfield(
          controller: titleInputController,
          hintText: LocaleKeys.textformfield_hintText_title.tr(),
          maxLength: 30,
        ),
        verticalSpaceTiny,
        if (isValidate)
          Text(
            titleInputError!,
            style: context.textTheme.titleSmall
                ?.copyWith(color: context.colorScheme.error),
          ),
      ],
    );
  }
}
