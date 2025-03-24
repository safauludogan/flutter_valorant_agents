part of '../startup_view.dart';

class _AppNameText extends StatelessWidget {
  const _AppNameText();

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: Text(
        LocaleKeys.appName,
        textAlign: TextAlign.center,
        style: context.textTheme.headlineLarge,
      ).tr(),
    );
  }
}
