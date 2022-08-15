import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/screen/buttonAnimation/buttonAni.dart';

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({Key? key}) : super(key: key);

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BtnAni(
                Color.fromRGBO(57, 92, 249, 1),
                Color.fromRGBO(44, 78, 233, 1),
              ),
              SizedBox(
                height: 20,
              ),
              BtnAni(
                Color.fromRGBO(251, 192, 45, 1),
                Color.fromRGBO(249, 168, 37, 1),
              ),
              SizedBox(
                height: 20,
              ),
              BtnAni(
                Color.fromRGBO(102, 187, 106, 1),
                Color.fromRGBO(67, 160, 71, 1),
              ),
              SizedBox(
                height: 20,
              ),
              BtnAni(
                Color.fromRGBO(211, 47, 47, 1),
                Color.fromRGBO(198, 40, 40, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
