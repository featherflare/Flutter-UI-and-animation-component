import 'package:flutter/material.dart';

class ContainerAni extends StatefulWidget {
  final double value;
  const ContainerAni({super.key, required this.value});

  @override
  State<ContainerAni> createState() => _ContainerAniState();
}

class _ContainerAniState extends State<ContainerAni>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.value > 0.5 ? 200.0 : 100.0,
      height: widget.value > 0.5 ? 100.0 : 200.0,
      color: widget.value > 0.5 ? Colors.red : Colors.blue,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 1000),
      child: const FlutterLogo(size: 50.0),
    );
  }
}
