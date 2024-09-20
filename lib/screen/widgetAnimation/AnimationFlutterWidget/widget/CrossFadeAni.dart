import 'package:flutter/material.dart';

class CrossFadeAni extends StatefulWidget {
  final double value;
  const CrossFadeAni({super.key, required this.value});

  @override
  State<CrossFadeAni> createState() => _CrossFadeAniState();
}

class _CrossFadeAniState extends State<CrossFadeAni> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      firstChild:
          const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
      secondChild:
          const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
      crossFadeState: widget.value > 0.5
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
