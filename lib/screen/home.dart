import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';
import 'package:practice_ui/helper/utility.dart';
import 'package:practice_ui/screen/inspiration/inspiration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Practices Flutter UI",
          style: AppTextStyle.header1(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: const [
            RouteText(
              text: "Inspiration App",
              number: 1,
              page: Inspiration(),
            ),
            RouteText(
              text: "Inspiration App",
              number: 1,
              page: Inspiration(),
            ),
            RouteText(
              text: "Inspiration App",
              number: 1,
              page: Inspiration(),
            ),
            RouteText(
              text: "Inspiration App",
              number: 1,
              page: Inspiration(),
            ),
          ],
        ),
      ),
    );
  }
}
