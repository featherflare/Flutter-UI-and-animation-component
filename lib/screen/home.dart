import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';
import 'package:practice_ui/helper/utility.dart';
import 'package:practice_ui/screen/buttonAnimation/buttonAnimation.dart';
import 'package:practice_ui/screen/foodDelivery/foodDelivery.dart';
import 'package:practice_ui/screen/inspiration/inspiration.dart';
import 'package:practice_ui/screen/pageAnimation/pageAnimation.dart';
import 'package:practice_ui/screen/pageTransition/pageTransition.dart';
import 'package:practice_ui/screen/partyAndSplash/partyAndSplash.dart';
import 'package:practice_ui/screen/rippleAnimation/rippleAnimation.dart';
import 'package:practice_ui/screen/splashAndLogin/splashAndLogin.dart';
import 'package:practice_ui/screen/userProfile/userProfile.dart';

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
        elevation: 10,
        shadowColor: Color(0xFFEDEDED),
        title: Text(
          "Practices Flutter UI",
          style: AppTextStyle.header1(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: const [
            SizedBox(
              height: 20,
            ),
            RouteText(
              text: "Inspiration App",
              number: 1,
              page: Inspiration(),
            ),
            RouteText(
              text: "PageAnimation Trip",
              number: 2,
              page: PageAnimation(),
            ),
            RouteText(
              text: "Food Delivery App",
              number: 3,
              page: StarterPage(),
            ),
            RouteText(
              text: "User Profile App",
              number: 4,
              page: UserProflie(),
            ),
            RouteText(
              text: "Ripple Animation",
              number: 5,
              page: RippleAnimation(),
            ),
            RouteText(
              text: "PageTransition Trip",
              number: 6,
              page: PageTransition(),
            ),
            RouteText(
              text: "Button Animation",
              number: 7,
              page: ButtonAnimation(),
            ),
            RouteText(
              text: "Splash and Login App",
              number: 8,
              page: SplashAndLogin(),
            ),
            RouteText(
              text: "Party App & Splash",
              number: 9,
              page: PartyAndSplash(),
            ),
            RouteText(
              text: "Splash and Login App",
              number: 10,
              page: SplashAndLogin(),
            ),
          ],
        ),
      ),
    );
  }
}
