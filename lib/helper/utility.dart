import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';

class RouteText extends StatelessWidget {
  final String text;
  final int number;
  final Widget page;
  const RouteText({
    Key? key,
    required this.text,
    required this.number,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$number. ",
              style: AppTextStyle.body1(),
            ),
            TextSpan(
              text: text,
              style: AppTextStyle.body1(),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => page,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class RouteText2 extends StatelessWidget {
  final String text;
  final int number;
  final Widget page;
  const RouteText2({
    Key? key,
    required this.text,
    required this.number,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$number. ",
              style: AppTextStyle.body1(),
            ),
            TextSpan(
              text: text,
              style: AppTextStyle.body1(),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => page,
                    ),
                    (Route<dynamic> route) => false),
            ),
          ],
        ),
      ),
    );
  }
}

class MyUtility {
  BuildContext context;

  MyUtility(this.context);

  Size get size => kIsWeb && MediaQuery.of(context).size.width >= 1024
      ? Size(1024, MediaQuery.of(context).size.height)
      : MediaQuery.of(context).size;

  double get safePadding => MediaQuery.of(context).padding.top;
}
