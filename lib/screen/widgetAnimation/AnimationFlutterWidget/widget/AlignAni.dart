import 'package:flutter/material.dart';
import 'package:practice_ui/helper/utility.dart';

class AlignAni extends StatefulWidget {
  final double value;
  const AlignAni({super.key, required this.value});

  @override
  State<AlignAni> createState() => _AlignAniState();
}

class _AlignAniState extends State<AlignAni> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).size.width,
      height: 50,
      child: AnimatedAlign(
        alignment:
            widget.value > 0.5 ? Alignment.centerLeft : Alignment.centerRight,
        duration: const Duration(milliseconds: 1000),
        child: const FlutterLogo(size: 50.0),
      ),
    );
  }
}
