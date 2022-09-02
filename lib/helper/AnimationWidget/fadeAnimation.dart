import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, offset }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget? child;
  final int duration;
  final bool fadeVertical;
  final double begin;

  FadeAnimation({
    this.delay = 0,
    this.child,
    this.duration = 500,
    this.fadeVertical = true,
    this.begin = -30.0,
  });

  @override
  Widget build(BuildContext context) {
    final TimelineTween<AniProps> tween = TimelineTween<AniProps>()
      ..addScene(
        begin: const Duration(milliseconds: 0),
        end: Duration(milliseconds: duration),
      ).animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(
        begin: const Duration(milliseconds: 0),
        end: Duration(milliseconds: duration),
        curve: Curves.easeOut,
      ).animate(AniProps.offset, tween: Tween(begin: begin, end: 0.0));
    return PlayAnimation<TimelineValue<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
          offset: fadeVertical
              ? Offset(
                  0,
                  animation.get(AniProps.offset),
                )
              : Offset(
                  animation.get(AniProps.offset),
                  0,
                ),
          child: child,
        ),
      ),
    );
  }
}
