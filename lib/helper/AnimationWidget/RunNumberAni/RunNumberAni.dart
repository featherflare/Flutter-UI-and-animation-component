import 'package:flutter/material.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/OutputNumber.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/SplitNumber.dart';

typedef NumAnimationTransitionBuilder = Widget Function(
  int value,
  int place,
  double animation,
);

class AnimatedNum extends ImplicitlyAnimatedWidget {
  SplitNum splitNum;
  NumAnimationTransitionBuilder transitionOut;
  NumAnimationTransitionBuilder transitionIn;
  AnimatedNum({
    Key? key,
    required this.splitNum,
    required this.transitionOut,
    required this.transitionIn,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );
  @override
  _AnimatedNumState createState() => _AnimatedNumState();
}

class _AnimatedNumState extends AnimatedWidgetBaseState<AnimatedNum> {
  SplitNumTween? _odometerTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _odometerTween = visitor(
      _odometerTween,
      widget.splitNum,
      (dynamic value) => SplitNumTween(begin: value as SplitNum),
    ) as SplitNumTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Number(
      transitionOut: widget.transitionOut,
      transitionIn: widget.transitionIn,
      splitNum: _odometerTween!.evaluate(animation),
    );
  }
}

class NumTransition extends AnimatedWidget {
  NumAnimationTransitionBuilder transitionOut;
  NumAnimationTransitionBuilder transitionIn;
  NumTransition({
    Key? key,
    required Animation<SplitNum> splitNum,
    required this.transitionOut,
    required this.transitionIn,
  }) : super(key: key, listenable: splitNum);
  Animation<SplitNum> get splitNum => listenable as Animation<SplitNum>;
  @override
  Widget build(BuildContext context) {
    return Number(
      transitionOut: transitionOut,
      transitionIn: transitionIn,
      splitNum: splitNum.value,
    );
  }
}
