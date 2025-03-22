import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Adapt mobile view
final class AdaptMobileView extends StatelessWidget {
  const AdaptMobileView({
    super.key,
    required this.phone,
    required this.tablet,
  });

  /// Phone widget
  final Widget phone;

  /// Tablet widget
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;
    return phone;
  }
}
