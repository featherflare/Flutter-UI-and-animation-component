import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, offset }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final TimelineTween<AniProps> tween = TimelineTween<AniProps>()
      ..addScene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
      ).animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      ).animate(AniProps.offset, tween: Tween(begin: -30.0, end: 0.0));
    return PlayAnimation<TimelineValue<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(
            0,
            animation.get(AniProps.offset),
          ),
          child: child,
        ),
      ),
    );
  }
}
