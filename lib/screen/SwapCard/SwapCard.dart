import 'package:flutter/material.dart';

class SwapCard extends StatefulWidget {
  const SwapCard({Key? key}) : super(key: key);

  @override
  State<SwapCard> createState() => _SwapCardState();
}

class _SwapCardState extends State<SwapCard> with TickerProviderStateMixin {
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
    return Stack(
      children: [
        IndexedStack(
          index: 1,
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
                          style: TextStyle(color: Colors.white, fontSize: 50),
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
      ],
    );
  }
}
