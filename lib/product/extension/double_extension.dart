import 'package:flutter/material.dart';

extension DoubleExtension on double {
  Widget get height => SizedBox(height: this);
  Widget get width => SizedBox(width: this);
}
