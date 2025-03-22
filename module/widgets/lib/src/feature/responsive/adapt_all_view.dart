import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Adapt all view
final class AdaptAllView extends StatelessWidget {
  const AdaptAllView({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  /// Phone widget
  final Widget phone;

  /// Tablet widget
  final Widget tablet;

  /// Desktop widget
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;
    if (ResponsiveBreakpoints.of(context).isDesktop) return desktop;
    return phone;
  }
}
