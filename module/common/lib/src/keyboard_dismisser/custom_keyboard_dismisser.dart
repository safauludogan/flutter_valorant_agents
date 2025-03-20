import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

/// Custom keyboard dismisser
class CustomKeyboardDismisser extends StatelessWidget {
  const CustomKeyboardDismisser({required this.child, super.key});

  /// Child widget
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(child: child);
  }
}
