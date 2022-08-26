import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';
import 'package:practice_ui/screen/widgetAnimation/utility/buttonChangeTextAnimation.dart';
import 'package:practice_ui/screen/widgetAnimation/utility/listAnimation.dart';
import 'package:practice_ui/screen/widgetAnimation/utility/passwordCheck.dart';

class WidgetAni extends StatefulWidget {
  const WidgetAni({Key? key}) : super(key: key);

  @override
  State<WidgetAni> createState() => _WidgetAniState();
}

class _WidgetAniState extends State<WidgetAni> {
  List<int> _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "Widget Animation",
                textAlign: TextAlign.center,
                style: AppTextStyle.body2(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TopicWidget(
              number: 1,
              text: "Button Change Text Animation",
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 100.0),
              child: ButtonChangeTextAni(
                height: 40,
                borderRadius: 50,
                borderColor: Color(0xffeeeeee),
                text1: "Test1",
                text2: "Test2",
                bgColor1: Color(0xffffffff),
                bgColor2: Color(0xffeeeeee),
              ),
            ),
            TopicWidget(
              number: 2,
              text: "List Widget Animation",
            ),
            ListAnimation(
              listItem: _list,
            ),
            TopicWidget(
              number: 3,
              text: "Password Check Animation",
            ),
            SizedBox(
              height: 30,
            ),
            PassWordCheck(),
            SizedBox(
              height: 30,
            ),
            TopicWidget(
              number: 4,
              text: "Button Change Text Animation",
            ),
          ],
        ),
      ),
    );
  }
}

class TopicWidget extends StatelessWidget {
  final String text;
  final int number;
  const TopicWidget({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$number. ",
            style: AppTextStyle.body4(),
          ),
          TextSpan(
            text: text,
            style: AppTextStyle.body4(),
          ),
        ],
      ),
    );
  }
}
