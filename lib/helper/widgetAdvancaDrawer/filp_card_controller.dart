import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice_ui/helper/widgetAdvancaDrawer/advance_drawer.dart';

class FlipCardController {
  FlipCardController? state;

  AnimationController? get controller => state?.controller;

  void toggleCard() => state?.toggleCard();

  void skew(double amount, {Duration? duration, Curve? curve}) {
    assert(0 <= amount && amount <= 1);

    // if (state!.isFront) {
    //   controller?.animateTo(amount, duration: duration, curve: curve!);
    // } else {
    //   controller?.animateTo(1 - amount, duration: duration, curve: curve!);
    // }
  }

  void hint({Duration? duration, Duration? total}) {
    assert(controller is AnimationController);
    if (!(controller is AnimationController)) {
      return;
    }

    if (controller!.isAnimating || controller!.value != 0) return;

    Duration? original = controller!.duration;
    controller!.duration = total ?? controller!.duration;
    controller!.forward();
    Timer(duration ?? const Duration(milliseconds: 150), () {
      controller!.reverse();
      controller!.duration = original;
    });
  }
}
