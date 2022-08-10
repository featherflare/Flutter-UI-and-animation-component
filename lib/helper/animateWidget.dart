import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ZoomOutLoop extends StatefulWidget {
  final Curve curve;
  final Widget child;
  final double begin;
  final double end;
  final Duration duration;
  const ZoomOutLoop(
      {Key? key,
      this.begin = 1.0,
      this.end = 1.0,
      this.duration = const Duration(seconds: 1),
      this.curve = Curves.linear,
      required this.child})
      : super(key: key);

  @override
  State<ZoomOutLoop> createState() => _ZoomOutLoopState();
}

class _ZoomOutLoopState extends State<ZoomOutLoop>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..forward()
      ..addListener(
        () {
          if (controller.isCompleted) {
            controller.repeat(reverse: true);
          }
        },
      );

    animation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: widget.child,
    );
  }
}
