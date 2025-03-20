import 'package:flutter/material.dart';

/// Loading Circular Progress
class LoadingCircular extends StatelessWidget {
  /// Constructor
  const LoadingCircular({this.color, this.strokeAlign, this.strokeWidth});

  /// Color
  final Color? color;

  /// Stroke Align
  /// Default is -12
  final double? strokeAlign;

  /// Stroke Width
  /// Default is 2
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? Colors.white,
      strokeWidth: strokeWidth ?? 2,
      strokeCap: StrokeCap.round,
      strokeAlign: strokeAlign ?? -12,
    );
  }
}
