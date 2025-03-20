import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

mixin FadeTransitionCurvedAnimateMixin<T extends StatefulWidget>
    on State<T>, TickerProvider, MountedMixin<T> {
  /// Animation controller
  late final AnimationController _animationController;

  /// Fade animation
  late final Animation<double> _fadeAnimation;

  /// Should start animation
  bool _previousLoadingState = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Start animation
  void startAnimation() {
    safeOperation(() {
      setState(() {
        _previousLoadingState = true;
      });
      _animationController.forward();
    });
  }

  /// Build animated card
  Widget buildAnimatedCard({required Widget child}) {
    if (!_previousLoadingState) {
      return const SizedBox.shrink();
    }
    return FadeTransition(opacity: _fadeAnimation, child: child);
  }
}
