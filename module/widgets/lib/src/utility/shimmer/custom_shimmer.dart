import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

@immutable
/// Shimmer effect for loading state
final class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    this.height = 100,
    this.width = 200,
    this.baseColor,
    this.highlightColor,
    this.child,
    super.key,
  });

  /// Height of the shimmer effect
  final double height;

  /// Width of the shimmer effect
  final double width;

  /// Child widget to be displayed inside the shimmer effect
  final Widget? child;

  /// Base color of the shimmer effect
  final Color? baseColor;

  /// Highlight color of the shimmer effect
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey[300]!,
        highlightColor: highlightColor ?? Colors.grey[100]!,
        child: child ?? shimmerCard,
      ),
    );
  }

  /// Shimmer card
  Widget get shimmerCard => Container(color: Colors.white);
}
