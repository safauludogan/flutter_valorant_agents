import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable

/// Lottie error
class LottieError extends StatefulWidget {
  const LottieError({super.key});

  @override
  State<LottieError> createState() => _LottieErrorState();
}

class _LottieErrorState extends State<LottieError>
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
    return Assets.lottie.lottieError.lottie(
      package: 'gen',
      repeat: true,
      controller: animationController,
      onLoaded: (composition) async {
        await Future<void>.delayed(const Duration(milliseconds: 400));
        animationController
          ..duration = composition.duration
          ..repeat();
      },
      //controller: controller,
    );
  }
}
