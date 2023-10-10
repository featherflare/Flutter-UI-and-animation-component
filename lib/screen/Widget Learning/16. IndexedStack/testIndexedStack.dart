import 'package:flutter/material.dart';

class TestIndexedStack extends StatefulWidget {
  const TestIndexedStack({Key? key}) : super(key: key);

  @override
  State<TestIndexedStack> createState() => _TestIndexedStackState();
}

class _TestIndexedStackState extends State<TestIndexedStack>
    with TickerProviderStateMixin {
  bool front = true;
  late AnimationController paddingFrontController;
  late Animation<double> paddingFrontValue;
  final List<int> _items = List<int>.generate(50, (int index) => index);
  int index = 1;

  @override
  void initState() {
    paddingFrontController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    paddingFrontValue = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(paddingFrontController)
      ..addListener(() {
        if (paddingFrontController.isCompleted) {
          setState(
            () {
              front = !front;
            },
          );
          paddingFrontController.reverse();
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IndexedStack(
              alignment: Alignment.center,
              sizing: StackFit.expand,
              index: front ? 0 : 1,
              children: [
                AnimatedBuilder(
                    animation: paddingFrontController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(paddingFrontValue.value, 0),
                        child: Container(
                          height: 300,
                          width: 200,
                          color: Colors.blue.withOpacity(0.2),
                          child: Center(
                            child: Text(
                              _items[index - 1].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        ),
                      );
                    }),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 300,
                    width: 200,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        _items[index].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                paddingFrontController.forward();
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
}
