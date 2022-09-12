import 'package:flutter/material.dart';
import 'dart:ui';

class TestImageFiltered extends StatefulWidget {
  const TestImageFiltered({Key? key}) : super(key: key);

  @override
  State<TestImageFiltered> createState() => _TestImageFilteredState();
}

class _TestImageFilteredState extends State<TestImageFiltered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
