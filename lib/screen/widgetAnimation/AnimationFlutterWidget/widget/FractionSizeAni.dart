import 'package:flutter/material.dart';

class FractionSizeAni extends StatefulWidget {
  final double value;
  const FractionSizeAni({super.key, required this.value});

  @override
  State<FractionSizeAni> createState() => _FractionSizeAniState();
}

class _FractionSizeAniState extends State<FractionSizeAni> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: ColoredBox(
        color: Colors.red,
        child: AnimatedFractionallySizedBox(
          widthFactor: widget.value > 0.5 ? 0.25 : 0.75,
          heightFactor: widget.value > 0.5 ? 0.75 : 0.25,
          alignment:
              widget.value > 0.5 ? Alignment.topLeft : Alignment.bottomRight,
          duration: const Duration(milliseconds: 1000),
          child: const ColoredBox(
            color: Colors.blue,
            child: FlutterLogo(size: 75),
          ),
        ),
      ),
    );
  }
}
