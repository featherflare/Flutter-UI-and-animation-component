import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';

class TestMatrixSimple extends StatefulWidget {
  const TestMatrixSimple({Key? key}) : super(key: key);

  @override
  State<TestMatrixSimple> createState() => _TestMatrixSimpleState();
}

class _TestMatrixSimpleState extends State<TestMatrixSimple> {
  double x = 0;
  double y = 0;
  double z = 0;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Rotation",
          style: AppTextStyle.body1(),
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: (() {
              setState(() {
                y = 0;
                x = 0;
              });
            }),
            child: Container(
              width: width - 200,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Reset".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Transform(
              origin: Offset(100, 100),
              transform: Matrix4.rotationX(x)
                ..rotateY(y)
                ..rotateZ(z)
                ..setEntry(3, 0, y / 1000),
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    y = y - details.delta.dx / 100;
                    x = x - details.delta.dy / 100;
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/one_2.jpeg"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
