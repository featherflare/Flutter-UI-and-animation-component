import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonChangeTextAni extends StatefulWidget {
  String text1;
  String text2;
  Color? textColor;
  bool border;
  Color borderColor;
  Color? bgColor1;
  Color? bgColor2;
  double borderRadius;
  double? height;
  double? width;
  double? elevation;
  double? fhElevation;
  ButtonChangeTextAni({
    Key? key,
    required this.text1,
    required this.text2,
    this.border = true,
    this.borderColor = Colors.black,
    this.textColor = Colors.black,
    this.bgColor1,
    this.bgColor2,
    this.borderRadius = 0,
    this.height,
    this.width,
    this.elevation = 0,
    this.fhElevation = 0,
  }) : super(key: key);

  @override
  State<ButtonChangeTextAni> createState() => _ButtonChangeTextAniState();
}

class _ButtonChangeTextAniState extends State<ButtonChangeTextAni> {
  bool isClick = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: widget.border
            ? Border.all(
                color: widget.borderColor,
              )
            : Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: MaterialButton(
        elevation: widget.elevation,
        focusElevation: widget.fhElevation,
        hoverElevation: widget.fhElevation,
        highlightElevation: widget.fhElevation,
        color: isClick ? widget.bgColor1 : widget.bgColor2,
        onPressed: () {
          setState(() {
            isClick = !isClick;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Text(
          isClick ? widget.text1 : widget.text2,
          style: TextStyle(
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
