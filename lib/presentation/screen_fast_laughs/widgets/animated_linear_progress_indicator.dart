import 'package:flutter/material.dart';

class AnimatedLinearProgressIndicator extends StatefulWidget {
  const AnimatedLinearProgressIndicator({super.key, this.value});
  final double? value;

  @override
  State<AnimatedLinearProgressIndicator> createState() =>
      _AnimatedLinearProgressIndicatorState();
}

class _AnimatedLinearProgressIndicatorState
    extends State<AnimatedLinearProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: widget.value ?? 0).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value == widget.value) return;
    double currentVal = animation.value;
    double newValue = widget.value ?? 0;
    if (currentVal != newValue) {
      animation = Tween(begin: currentVal, end: newValue).animate(controller);
      controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value == null) {
      return const LinearProgressIndicator();
    }
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return LinearProgressIndicator(
            value: animation.value,
          );
        });
  }
}
