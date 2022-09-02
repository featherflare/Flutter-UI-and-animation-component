import 'package:flutter/material.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/RunNumberAni.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/SplitNumber.dart';

class Number extends StatelessWidget {
  final NumAnimationTransitionBuilder transitionOut;
  final NumAnimationTransitionBuilder transitionIn;
  final SplitNum splitNum;
  const Number({
    Key? key,
    required this.transitionOut,
    required this.transitionIn,
    required this.splitNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = splitNum.digits.keys.length; i > 0; i--)
          Stack(
            children: [
              transitionOut(
                SplitNum.digit(splitNum.digits[i]!),
                i,
                SplitNum.progress(splitNum.digits[i]!),
              ),
              transitionIn(
                SplitNum.digit(splitNum.digits[i]! + 1),
                i,
                SplitNum.progress(splitNum.digits[i]!),
              )
            ],
          )
      ],
    );
  }
}
