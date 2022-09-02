import 'package:flutter/material.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/RunNumberAni.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/SplitNumber.dart';

class AnimatedRunNumber extends StatelessWidget {
  final SplitNum number;
  final Duration duration;
  final double letterWidth;
  final Widget? groupSeparator;
  final TextStyle? numberTextStyle;
  final double verticalOffset;
  final Curve curve;

  AnimatedRunNumber({
    Key? key,
    required this.number,
    required this.duration,
    required this.letterWidth,
    this.groupSeparator,
    this.numberTextStyle,
    this.verticalOffset = 20,
    this.curve = Curves.linear,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedNum(
      curve: curve,
      splitNum: number,
      transitionIn: (value, place, animation) => _buildSlideNumberDigit(
        value,
        place,
        animation,
        verticalOffset * animation - verticalOffset,
        groupSeparator,
        numberTextStyle,
        letterWidth,
      ),
      transitionOut: (value, place, animation) => _buildSlideNumberDigit(
        value,
        place,
        1.0 - animation,
        verticalOffset * animation,
        groupSeparator,
        numberTextStyle,
        letterWidth,
      ),
      duration: duration,
    );
  }
}

class SlideNumTransition extends StatelessWidget {
  final Animation<SplitNum> numAnimation;
  final double letterWidth;
  final Widget? groupSeparator;
  final TextStyle? numberTextStyle;
  final double verticalOffset;

  SlideNumTransition({
    Key? key,
    required this.numAnimation,
    this.numberTextStyle,
    required this.letterWidth,
    this.verticalOffset = 20,
    this.groupSeparator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NumTransition(
      splitNum: numAnimation,
      transitionIn: (value, place, animation) => _buildSlideNumberDigit(
        value,
        place,
        animation,
        verticalOffset * animation - verticalOffset,
        groupSeparator,
        numberTextStyle,
        letterWidth,
      ),
      transitionOut: (value, place, animation) => _buildSlideNumberDigit(
        value,
        place,
        1.0 - animation,
        verticalOffset * animation,
        groupSeparator,
        numberTextStyle,
        letterWidth,
      ),
    );
  }
}

Widget _buildSlideNumberDigit(
  int value,
  int plase,
  double opacity,
  double offsetY,
  Widget? groupSeparator,
  TextStyle? numberTextStyle,
  double letterWidth,
) {
  final d = plase - 1;
  if (groupSeparator != null && (d != 0 && d % 3 == 0)) {
    return Row(
      children: [
        _valueText(value, opacity, offsetY, numberTextStyle, letterWidth),
        groupSeparator,
      ],
    );
  } else {
    return _valueText(value, opacity, offsetY, numberTextStyle, letterWidth);
  }
}

Widget _valueText(
  int value,
  double opacity,
  double offsetY,
  TextStyle? numberTextStyle,
  double letterWidth,
) {
  return Transform.translate(
    offset: Offset(0, offsetY),
    child: Opacity(
      opacity: opacity,
      child: SizedBox(
        width: letterWidth,
        child: Text(
          value.toString(),
          style: numberTextStyle,
        ),
      ),
    ),
  );
}
