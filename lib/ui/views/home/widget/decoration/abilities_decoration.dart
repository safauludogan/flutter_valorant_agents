import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable

/// Abilities decoration
final class AbilitiesDecoration extends BoxDecoration {
  AbilitiesDecoration()
      : super(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        );
}
