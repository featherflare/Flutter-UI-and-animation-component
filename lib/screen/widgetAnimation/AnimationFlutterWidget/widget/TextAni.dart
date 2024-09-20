import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';

class TextAni extends StatefulWidget {
  final double value;
  const TextAni({super.key, required this.value});

  @override
  State<TextAni> createState() => _TextAniState();
}

class _TextAniState extends State<TextAni> {
  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 1000),
      style: widget.value > 0.5
          ? AppTextStyle.header1(color: Colors.red)
          : AppTextStyle.body(color: Colors.blue),
      child: const Text('test'),
    );
  }
}
