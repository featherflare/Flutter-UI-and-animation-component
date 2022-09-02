import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odometer/odometer.dart';

class OdometerTest extends StatefulWidget {
  const OdometerTest({Key? key}) : super(key: key);

  @override
  State<OdometerTest> createState() => _OdometerTestState();
}

class _OdometerTestState extends State<OdometerTest>
    with SingleTickerProviderStateMixin {
  int _counter = 10000;
  AnimationController? animationController;
  late Animation<OdometerNumber> animation;
  void _incrementCounter() {
    setState(() {
      _counter += 88;
    });
  }

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation =
        OdometerTween(begin: OdometerNumber(10000), end: OdometerNumber(12000))
            .animate(
      CurvedAnimation(curve: Curves.easeIn, parent: animationController!),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Odometer Demo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSlideOdometerNumber(
              letterWidth: 20,
              odometerNumber: OdometerNumber(_counter),
              duration: const Duration(seconds: 1),
              numberTextStyle: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SlideOdometerTransition(
                letterWidth: 20,
                odometerAnimation: animation,
                numberTextStyle: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => animationController!.reverse(),
                    child: const Text('Reverse'),
                  ),
                  ElevatedButton(
                    onPressed: () => animationController!.forward(),
                    child: const Text('Forward'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
