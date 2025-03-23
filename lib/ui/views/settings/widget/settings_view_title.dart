part of '../settings_view.dart';

class _SettingsViewTitle extends StatelessWidget {
  const _SettingsViewTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.settings_title,
      style: context.textTheme.bodyMedium,
    ).tr();
  }
}
