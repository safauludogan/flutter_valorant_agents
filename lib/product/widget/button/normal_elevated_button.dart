import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/ui/styles/paddings.dart';
import 'package:gen/gen.dart';

/// Normal base elevated button
/// Radius is 12 [ProjectRadius.small]
/// Background color is [ColorName.primary300]
class NormalElevatedButton extends StatelessWidget {
  const NormalElevatedButton({
    required this.onPressed,
    required this.text,
    this.bgColor,
    this.isLoading = false,
    super.key,
  });

  /// Button onPressed
  final VoidCallback onPressed;

  /// Button text
  final String text;

  /// Is loading
  final bool isLoading;

  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
      ),
      child: Center(
        child: Padding(
          padding: Paddings.p16v,
          child: Text(
            text,
          ).tr(),
        ),
      ),
    );
  }
}
