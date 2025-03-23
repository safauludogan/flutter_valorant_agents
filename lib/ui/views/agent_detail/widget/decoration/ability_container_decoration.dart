import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Ability container decoration
final class AbilityContainerDecoration extends BoxDecoration {
  /// Ability container decoration
  AbilityContainerDecoration()
      : super(
          color: Colors.black.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.2),
          ),
        );
}
