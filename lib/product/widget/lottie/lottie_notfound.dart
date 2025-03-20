import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_valorant_agents/product/utility/size/widget_size.dart';
import 'package:gen/gen.dart';

@immutable

/// Lottie not found
final class LottieNotFound extends StatefulWidget {
  const LottieNotFound({super.key});

  @override
  State<LottieNotFound> createState() => _LottieNotFoundState();
}

class _LottieNotFoundState extends State<LottieNotFound>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.lottieNotfound.lottie(
      height: WidgetSizes.spacingXxlL14.h,
      package: 'gen',
      repeat: true,
      controller: animationController,
      onLoaded: (composition) async {
        animationController
          ..duration = composition.duration
          ..repeat();
      },
    );
  }
}
