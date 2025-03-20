import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

@immutable

/// Lottie no internet connection
class LottieNoInternetConnection extends StatefulWidget {
  const LottieNoInternetConnection({super.key});

  @override
  State<LottieNoInternetConnection> createState() =>
      _LottieNoInternetConnectionState();
}

class _LottieNoInternetConnectionState extends State<LottieNoInternetConnection>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.lottieNoInternetConnection.lottie(
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
