import 'package:flutter/material.dart';

@immutable

/// Filter chip decoration
final class FilterChipDecoration extends BoxDecoration {
  FilterChipDecoration()
      : super(
          color: Colors.red,
          shape: BoxShape.circle,
        );
}
