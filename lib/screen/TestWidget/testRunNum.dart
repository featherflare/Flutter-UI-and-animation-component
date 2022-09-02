import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/SplitNumber.dart';
import 'package:practice_ui/helper/AnimationWidget/RunNumberAni/TypeOfAni.dart';

class TestRunNum extends StatefulWidget {
  const TestRunNum({Key? key}) : super(key: key);

  @override
  State<TestRunNum> createState() => _TestRunNumState();
}

class _TestRunNumState extends State<TestRunNum> with TickerProviderStateMixin {
  int _counter = 10000;
  AnimationController? animationController;
  late Animation<SplitNum> numAnimation;

  void _increaseCounter1() {
    setState(() {
      _counter += 1;
    });
  }

  void _increaseCounter100() {
    setState(() {
      _counter += 100;
    });
  }

  void _increaseCounter10000() {
    setState(() {
      _counter += 10000;
    });
  }

  void _decreaseCounter1() {
    setState(() {
      _counter -= 1;
    });
  }

  void _decreaseCounter100() {
    setState(() {
      _counter -= 100;
    });
  }

  void _decreaseCounter10000() {
    setState(() {
      _counter -= 10000;
    });
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward();
    numAnimation = SplitNumTween(
      begin: SplitNum(0),
      end: SplitNum(10000),
    ).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideNumTransition(
              numAnimation: numAnimation,
              letterWidth: 20,
              numberTextStyle: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            AnimatedRunNumber(
              number: SplitNum(_counter),
              duration: Duration(milliseconds: 500),
              letterWidth: 20,
              numberTextStyle: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _increaseCounter1,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  child: const Text('+1'),
                ),
                ElevatedButton(
                  onPressed: _increaseCounter100,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  child: const Text('+100'),
                ),
                ElevatedButton(
                  onPressed: _increaseCounter10000,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  child: const Text('+10000'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _decreaseCounter1,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  child: const Text('-1'),
                ),
                ElevatedButton(
                  onPressed: _decreaseCounter100,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  child: const Text('-100'),
                ),
                ElevatedButton(
                  onPressed: _decreaseCounter10000,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  child: const Text('-10000'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
