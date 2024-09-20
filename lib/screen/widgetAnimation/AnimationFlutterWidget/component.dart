import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';

class AnimationComponent extends StatefulWidget {
  final String header;
  final Widget child;
  final AnimationController controller;
  const AnimationComponent(
      {super.key,
      required this.header,
      required this.child,
      required this.controller});

  @override
  State<AnimationComponent> createState() => _AnimationComponentState();
}

class _AnimationComponentState extends State<AnimationComponent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.header,
          style: AppTextStyle.body1(),
        ),
        const SizedBox(
          height: 16,
        ),
        widget.child,
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
