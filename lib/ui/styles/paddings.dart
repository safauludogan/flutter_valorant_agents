import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Padding utility class
final class Paddings {
  /// All Padding
  /// [p1a] 1.h
  static final EdgeInsets p1a = EdgeInsets.all(1.h);

  /// [p4a] 4.h
  static final EdgeInsets p4a = EdgeInsets.all(4.h);

  /// [p8a] 8.h
  static final EdgeInsets p8a = EdgeInsets.all(8.h);

  /// [p16a] 16.h
  static final EdgeInsets p16a = EdgeInsets.all(16.h);

  /// [p32a] 32.h
  static final EdgeInsets p32a = EdgeInsets.all(32.h);

  /// Horizontal Padding
  /// [p1h] 1.h
  static final EdgeInsets p1h = EdgeInsets.symmetric(horizontal: 1.h);

  /// [p4h] 2.h
  static final EdgeInsets p2h = EdgeInsets.symmetric(horizontal: 2.h);

  /// [p4h] 4.h
  static final EdgeInsets p4h = EdgeInsets.symmetric(horizontal: 4.h);

  /// [p8h] 8.h
  static final EdgeInsets p8h = EdgeInsets.symmetric(horizontal: 8.h);

  /// [p16h] 16.h
  static final EdgeInsets p16h = EdgeInsets.symmetric(horizontal: 16.h);

  /// [p32h] 32.h
  static final EdgeInsets p32h = EdgeInsets.symmetric(horizontal: 32.h);

  /// Vertical Padding
  /// [p1v] 1.h
  static final EdgeInsets p1v = EdgeInsets.symmetric(vertical: 1.h);

  /// [p4v] 4.h
  static final EdgeInsets p4v = EdgeInsets.symmetric(vertical: 4.h);

  /// [p8v] 8.h
  static final EdgeInsets p8v = EdgeInsets.symmetric(vertical: 8.h);

  /// [p16v] 16.h
  static final EdgeInsets p16v = EdgeInsets.symmetric(vertical: 16.h);

  /// [p32v] 32.h
  static final EdgeInsets p32v = EdgeInsets.symmetric(vertical: 32.h);

  /// Left Padding
  /// [p16l] 16.h
  static final EdgeInsets p16l = EdgeInsets.only(left: 16.h);

  /// [p32l] 32.h
  static final EdgeInsets p32l = EdgeInsets.only(left: 32.h);

  /// Right Padding
  /// [p4r] 4.h
  static final EdgeInsets p4r = EdgeInsets.only(right: 4.h);

  /// [p8r] 8.h
  static final EdgeInsets p8r = EdgeInsets.only(right: 8.h);

  /// [p16r] 16.h
  static final EdgeInsets p16r = EdgeInsets.only(right: 16.h);

  /// [p32r] 32.h
  static final EdgeInsets p32r = EdgeInsets.only(right: 32.h);

  /// Other Padding
  /// [p12v4h] 12.h 4.w
  static final EdgeInsets p12v4h =
      EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.h);
}
