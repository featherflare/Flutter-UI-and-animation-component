import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestPhysicalModel extends StatefulWidget {
  const TestPhysicalModel({Key? key}) : super(key: key);

  @override
  State<TestPhysicalModel> createState() => _TestPhysicalModelState();
}

class _TestPhysicalModelState extends State<TestPhysicalModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhysicalModel(
          color: Colors.red,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withOpacity(0.0),
          ),
          shadowColor: Colors.pink,
          elevation: 8,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
