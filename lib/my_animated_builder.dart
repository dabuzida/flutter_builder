import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyAnimatedBuilder extends StatefulWidget {
  const MyAnimatedBuilder({super.key});

  @override
  State<MyAnimatedBuilder> createState() => _MyAnimatedBuilderState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _MyAnimatedBuilderState extends State<MyAnimatedBuilder> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 30),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        border: Border.all(color: Colors.blue),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
          child: const Center(
            child: Text('Whee!'),
          ),
        ),
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * math.pi,
            child: child,
          );
        },
      ),
    );
  }
}
