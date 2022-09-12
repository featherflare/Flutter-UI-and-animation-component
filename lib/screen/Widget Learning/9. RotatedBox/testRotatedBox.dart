import 'package:flutter/material.dart';

class TestRotatedBox extends StatefulWidget {
  const TestRotatedBox({Key? key}) : super(key: key);

  @override
  State<TestRotatedBox> createState() => _TestRotatedBoxState();
}

class _TestRotatedBoxState extends State<TestRotatedBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text('asdasdasd'),
          ),
          Text('asdasdasdasdasdasdasdasdasdasd'),
        ],
      ),
    );
  }
}
