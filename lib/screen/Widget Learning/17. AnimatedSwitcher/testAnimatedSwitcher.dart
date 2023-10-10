import 'package:flutter/material.dart';

class TestAnimatedSwitcher extends StatefulWidget {
  const TestAnimatedSwitcher({Key? key}) : super(key: key);

  @override
  State<TestAnimatedSwitcher> createState() => _TestAnimatedSwitcherState();
}

class _TestAnimatedSwitcherState extends State<TestAnimatedSwitcher> {
  int _widgetId = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: _renderWidget(),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _updateWidget();
                });
              },
              child: Text(
                "Switch",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderWidget() {
    return _widgetId == 1 ? _myWidget1() : _myWidget2();
  }

  void _updateWidget() {
    setState(() {
      _widgetId = _widgetId == 1 ? 2 : 1;
    });
  }

  Widget _myWidget1() {
    return Container(
      key: ValueKey(1),
      height: 250,
      width: 250,
      color: Colors.green,
    );
  }

  Widget _myWidget2() {
    return Container(
      key: ValueKey(2),
      height: 250,
      width: 250,
      color: Colors.blue,
    );
  }
}
