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
    final MovieTween tween = MovieTween()
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
      ).tween(AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      ).tween(AniProps.offset, Tween(begin: -30.0, end: 0.0));
    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, animation, child) => Opacity(
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
