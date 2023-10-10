import 'package:flutter/material.dart';

class TestAnimatedCrossFade extends StatefulWidget {
  const TestAnimatedCrossFade({Key? key}) : super(key: key);

  @override
  State<TestAnimatedCrossFade> createState() => _TestAnimatedCrossFadeState();
}

class _TestAnimatedCrossFadeState extends State<TestAnimatedCrossFade> {
  bool firstOrSecond = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              firstChild: Container(
                height: 200,
                width: 250,
                color: Colors.blue,
              ),
              // Second widget
              secondChild: Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.green,
                ),
              ),
              firstCurve: Curves.easeOut,
              secondCurve: Curves.easeIn,
              sizeCurve: Curves.bounceOut,
              crossFadeState: firstOrSecond
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    firstOrSecond = !firstOrSecond;
                  },
                );
              },
              child: Text("Switch", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
