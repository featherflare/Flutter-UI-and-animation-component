import 'package:flutter/material.dart';

class TestListWheelScrollView extends StatefulWidget {
  const TestListWheelScrollView({Key? key}) : super(key: key);

  @override
  State<TestListWheelScrollView> createState() =>
      _TestListWheelScrollViewState();
}

class _TestListWheelScrollViewState extends State<TestListWheelScrollView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        children: [
          for (int i = 0; i <= 40; i++)
            Container(
              width: 500,
              height: 100,
              child: ColoredBox(
                color: Colors.blue.withOpacity(i * 2 / 100),
              ),
            ),
        ],
        itemExtent: 100,
        useMagnifier: true,
        magnification: 1.5,
      ),
    );
  }
}
