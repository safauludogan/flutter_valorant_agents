import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';

class NormalIconElevatedButton extends StatelessWidget {
  const NormalIconElevatedButton({
    required this.title,
    required this.onPressed,
    required this.icon,
    this.bgColor,
    this.textColor,
    super.key,
  });

  /// Title text
  final String title;

  /// Icon for button
  final Widget icon;

  /// Button background color
  final Color? bgColor;

  /// Button text color
  final Color? textColor;

  /// Button on pressed
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: const Size(double.infinity, 52),
      ),
      label: Text(
        title,
      ).tr(),
      icon: icon,
    );
  }
}
