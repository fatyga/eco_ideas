import 'package:flutter/material.dart';

class BlinkAnimation extends StatefulWidget {
  const BlinkAnimation({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<BlinkAnimation> createState() => _BlinkAnimationState();
}

class _BlinkAnimationState extends State<BlinkAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: widget.child);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
