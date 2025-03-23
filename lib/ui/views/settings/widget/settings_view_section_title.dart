part of '../settings_view.dart';

/// Settings view section title
class _SettingsViewSectionTitle extends StatelessWidget {
  const _SettingsViewSectionTitle({
    required this.title,
    super.key,
  });

  /// Title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: ColorName.crimsonRed,
            borderRadius: Radiuses.b2r,
          ),
        ),
        WidgetSizes.spacingS.w.width,
        Text(
          title,
          style: context.textTheme.displayMedium?.copyWith(
            letterSpacing: 1.2,
          ),
        ).tr(),
      ],
    );
  }
}
