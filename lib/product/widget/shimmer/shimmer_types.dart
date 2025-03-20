import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:flutter_valorant_agents/ui/styles/radiuses.dart';
import 'package:widgets/widgets.dart';

/// Shimmer title card
Widget get shimmerTitleCard => ClipRRect(
      borderRadius: Radiuses.b4r,
      child: CustomShimmer(
        width: WidgetSizes.spacingS.w,
        height: WidgetSizes.spacingM.h,
      ),
    );

/// Shimmer subtitle card
Widget get shimmerSubtitleCard => ClipRRect(
      borderRadius: Radiuses.b4r,
      child: CustomShimmer(
        width: WidgetSizes.spacingS.w,
        height: WidgetSizes.spacingM.h,
      ),
    );

/// Shimmer image card
Widget get shimmerImageCard => ClipRRect(
      borderRadius: Radiuses.b8r,
      child: CustomShimmer(
        width: WidgetSizes.spacingXxl6.w,
        height: WidgetSizes.spacingXxl6.h,
      ),
    );
