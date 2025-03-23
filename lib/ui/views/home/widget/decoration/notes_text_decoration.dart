import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/extension/context_extension.dart';

@immutable

/// Notes text decoration
final class NotesTextDecoration extends BoxDecoration {
  NotesTextDecoration(BuildContext context)
      : super(
          color: context.colorScheme.surfaceTint.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8.r),
        );
}
