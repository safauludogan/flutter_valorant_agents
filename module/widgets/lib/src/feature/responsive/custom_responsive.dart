import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Custom responsive
///
/// [MOBILE] 0 - 450
/// [TABLET] 451 - 800
/// [DESKTOP] 801 - 1920
/// [4K] 1921 - infinity
final class CustomResponsive {
  /// Custom responsive builder
  static Widget build(BuildContext context, Widget? child) {
    return ResponsiveBreakpoints.builder(
      child: child!,
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }
}
