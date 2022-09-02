import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

class SplitNum {
  final int number;
  final Map<int, double> digits;

  SplitNum(this.number) : digits = generateDigits(number);

  SplitNum.fromDigits(this.digits) : number = digits[1]!.toInt();

  static Map<int, double> generateDigits(int number) {
    final digits = <int, double>{};
    if (number <= 0) return {1: 0};
    var v = number;
    var place = 1;
    while (v > 0) {
      digits[place] = v.toDouble();
      v = v ~/ 10;
      place++;
    }
    return digits;
  }

  static int digit(double value) => (value % 10).truncate();

  static double progress(double value) => value - value.truncate();

  static SplitNum lerp(
    SplitNum start,
    SplitNum end,
    double t,
  ) {
    final keyLength = max(start.digits.length, end.digits.length);
    final digits = <int, double>{};
    for (var i = 1; i <= keyLength; i++) {
      digits[i] = lerpDouble(start.digits[i], end.digits[i], t)!;
    }
    return SplitNum.fromDigits(digits);
  }

  @override
  String toString() {
    return 'OdometerNumber $number';
  }
}

class SplitNumTween extends Tween<SplitNum> {
  SplitNumTween({SplitNum? begin, SplitNum? end})
      : super(begin: begin, end: end);

  @override
  SplitNum transform(double t) {
    if (t == 0.0) {
      return begin!;
    }
    if (t == 1.0) {
      if (begin!.digits.keys.length > end!.digits.keys.length) {
        end!.digits.addEntries(
          begin!.digits.keys.toSet().difference(end!.digits.keys.toSet()).map(
                (e) => MapEntry(e, 0),
              ),
        );
      }
      return end!;
    }
    return lerp(t);
  }

  @override
  SplitNum lerp(double t) => SplitNum.lerp(begin!, end!, t);
}
