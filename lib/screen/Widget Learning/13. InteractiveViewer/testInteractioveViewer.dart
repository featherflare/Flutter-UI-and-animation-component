import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestInteractiveViewer extends StatefulWidget {
  const TestInteractiveViewer({Key? key}) : super(key: key);

  @override
  State<TestInteractiveViewer> createState() => _TestInteractiveViewerState();
}

class _TestInteractiveViewerState extends State<TestInteractiveViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          // constrained: false,
          // scaleEnabled: false,
          boundaryMargin: EdgeInsets.all(42),
          minScale: 0.1,
          maxScale: 1.6,
          // onInteractionStart: ,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/one-7.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
