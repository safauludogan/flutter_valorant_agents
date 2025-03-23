import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:gen/gen.dart';

/// English flag image
class ImgEnglish extends StatelessWidget {
  /// Constructor
  const ImgEnglish({this.width, super.key});

  /// Width
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Assets.images.imgEnglish.image(
      package: 'gen',
      fit: BoxFit.cover,
      width: width ?? WidgetSizes.spacingXl.w,
    );
  }
}
