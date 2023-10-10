import 'package:flutter/material.dart';
import 'package:practice_ui/screen/SwapCard/SwapCard.dart';

class TestSwapCard extends StatefulWidget {
  const TestSwapCard({Key? key}) : super(key: key);

  @override
  State<TestSwapCard> createState() => _TestSwapCardState();
}

class _TestSwapCardState extends State<TestSwapCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SwapCard(),
    );
  }
}
