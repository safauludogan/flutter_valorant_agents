import 'package:flutter/material.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:gen/gen.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({this.callback, this.color, super.key});

  /// Callback
  final VoidCallback? callback;

  /// Color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Assets.icons.icSearch.svg(
      package: 'gen',
      height: WidgetSizes.spacingM,
      colorFilter: ColorFilter.mode(
        color ?? ColorName.gray700,
        BlendMode.srcIn,
      ),
    );
  }
}
