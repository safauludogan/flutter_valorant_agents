import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Ability icon container decoration
final class AbilityIconContainerDecoration extends BoxDecoration {
  /// Ability icon container decoration
  AbilityIconContainerDecoration()
      : super(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
        );
}
