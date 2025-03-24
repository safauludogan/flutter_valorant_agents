part of '../startup_view.dart';

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(LocaleKeys.startup_loading, style: context.textTheme.bodyMedium)
            .tr(),
        horizontalSpaceSmall,
        const LoadingCircular(
          color: ColorName.primary,
        ),
      ],
    );
  }
}
