import 'package:flutter/material.dart';
import 'dart:math';
import 'package:practice_ui/helper/widgetAdvancaDrawer/advance_drawer.dart';
import 'package:practice_ui/helper/widgetAdvancaDrawer/advance_drawer_controller.dart';

class TestDrawer extends StatefulWidget {
  const TestDrawer({Key? key}) : super(key: key);

  @override
  State<TestDrawer> createState() => _TestDrawerState();
}

class _TestDrawerState extends State<TestDrawer> {
  final _advancedDrawerController = AdvanceDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvanceDrawer(
      backdropColor: Colors.grey.shade800,
      animationCurve: Curves.easeInOut,
      controller: _advancedDrawerController,
      animationDuration: const Duration(milliseconds: 300),
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          // shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Center(
          child: IconButton(
            onPressed: _advancedDrawerController.showDrawer,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      back: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: RotatedBox(
          quarterTurns: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Mr.Test Test",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
