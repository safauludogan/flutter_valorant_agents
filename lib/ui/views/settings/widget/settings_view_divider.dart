part of '../settings_view.dart';

class _SettingsViewDivider extends StatelessWidget {
  const _SettingsViewDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.p32v,
      child: Container(
        height: 1,
        color: ColorName.gray400.withValues(alpha: .5),
      ),
    );
  }
}
