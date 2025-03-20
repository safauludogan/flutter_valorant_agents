import 'package:flutter/material.dart';

@immutable
final class CardBgDecoration extends BoxDecoration {
  CardBgDecoration({required List<Color>? colors})
      : super(
          gradient: LinearGradient(
            colors: colors ?? [Colors.grey.shade800, Colors.grey.shade900],
          ),
        );
}
