import 'package:flutter/material.dart';

@immutable

/// Filter chip decoration
final class RoleBgDecoration extends BoxDecoration {
  RoleBgDecoration({Color? color})
      : super(
          color: color ?? Colors.red,
          shape: BoxShape.circle,
        );
}
