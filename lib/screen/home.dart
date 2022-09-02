import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';
import 'package:practice_ui/helper/utility.dart';
import 'package:practice_ui/screen/Clipper/clipper.dart';
import 'package:practice_ui/screen/LibTest/ConcentricTransition/ConcentricTransition.dart';
import 'package:practice_ui/screen/LibTest/Odometer/Odometer.dart';
import 'package:practice_ui/screen/LibTest/StaggeredGridViewExample/StaggeredGridViewExample.dart';
import 'package:practice_ui/screen/Login&SingUP/main.dart';
import 'package:practice_ui/screen/TestWidget/testCurveNavigationBar.dart';
import 'package:practice_ui/screen/TestWidget/testDrawer.dart';
import 'package:practice_ui/screen/TestWidget/testElastic.dart';
import 'package:practice_ui/screen/TestWidget/testRunNum.dart';
import 'package:practice_ui/screen/appWithIndicator/appWithIndicator.dart';
import 'package:practice_ui/screen/buttonAnimation/buttonAnimation.dart';
import 'package:practice_ui/screen/carousel/carousel.dart';
import 'package:practice_ui/screen/e-commerce/e-commerce.dart';
import 'package:practice_ui/screen/foodDelivery/foodDelivery.dart';
import 'package:practice_ui/screen/googleMap/GoogleMap.dart';
import 'package:practice_ui/screen/googleMap/pages/map_circles.dart';
import 'package:practice_ui/screen/homeService/page/start.dart';
import 'package:practice_ui/screen/inspiration/inspiration.dart';
import 'package:practice_ui/screen/loginPage/loginPage1.dart';
import 'package:practice_ui/screen/loginPage/loginPage2.dart';
import 'package:practice_ui/screen/matrix4Test/matrix4Test1.dart';
import 'package:practice_ui/screen/pageAnimation/pageAnimation.dart';
import 'package:practice_ui/screen/pageTransition/pageTransition.dart';
import 'package:practice_ui/screen/partyAndSplash/partyAndSplash.dart';
import 'package:practice_ui/screen/rippleAnimation/rippleAnimation.dart';
import 'package:practice_ui/screen/shoeShop/shoeShop.dart';
import 'package:practice_ui/screen/sockShop/sockShop.dart';
import 'package:practice_ui/screen/splashAndLogin/splashAndLogin.dart';
import 'package:practice_ui/screen/travel/travel.dart';
import 'package:practice_ui/screen/userProfile/userProfile.dart';
import 'package:practice_ui/screen/wallet/wallet.dart';
import 'package:practice_ui/screen/widgetAnimation/widgetAnimation.dart';

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
        shadowColor: const Color(0xFFEDEDED),
        title: Text(
          "Practices Flutter UI",
          style: AppTextStyle.header1(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            const RouteText(
              text: "Inspiration App",
              number: 1,
              page: Inspiration(),
            ),
            const RouteText(
              text: "PageAnimation Trip",
              number: 2,
              page: PageAnimation(),
            ),
            const RouteText(
              text: "Food Delivery App",
              number: 3,
              page: StarterPage(),
            ),
            const RouteText(
              text: "User Profile App",
              number: 4,
              page: UserProflie(),
            ),
            const RouteText(
              text: "Ripple Animation",
              number: 5,
              page: RippleAnimation(),
            ),
            const RouteText(
              text: "PageTransition Trip",
              number: 6,
              page: PageTransition(),
            ),
            const RouteText(
              text: "Button Animation",
              number: 7,
              page: ButtonAnimation(),
            ),
            const RouteText(
              text: "Splash and Login App",
              number: 8,
              page: SplashAndLogin(),
            ),
            const RouteText(
              text: "Party App & Splash",
              number: 9,
              page: PartyAndSplash(),
            ),
            const RouteText(
              text: "Travel App",
              number: 10,
              page: TravelPage(),
            ),
            const RouteText(
              text: "Login Page 1",
              number: 11,
              page: LoginPage1(),
            ),
            const RouteText(
              text: "Login Page 2",
              number: 12,
              page: LoginPage2(),
            ),
            const RouteText(
              text: "Shoe Shopping App",
              number: 13,
              page: ShoeShop(),
            ),
            const RouteText(
              text: "E-commerce App",
              number: 14,
              page: EComApp(),
            ),
            const RouteText(
              text: "Carousel & Animation",
              number: 15,
              page: CarouselTest(),
            ),
            const RouteText(
              text: "Socks Shop App",
              number: 16,
              page: SocksShop(),
            ),
            const RouteText(
              text: "App With Indicator",
              number: 17,
              page: AppWithIndicator(),
            ),
            const RouteText(
              text: "Login And SignUp Page",
              number: 18,
              page: MainLoginNSignUp(),
            ),
            const RouteText(
              text: "Home Services App",
              number: 19,
              page: StartPage(),
            ),
            const RouteText(
              text: "Widget Animation",
              number: 20,
              page: WidgetAni(),
            ),
            const RouteText(
              text: "Wallet App",
              number: 21,
              page: WalletApp(),
            ),
            const RouteText(
              text: "Clipper Practice",
              number: 22,
              page: ClipperTest(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                'Package Interest',
                style: AppTextStyle.body1(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  RouteText(
                    text: "ConcentricTransition",
                    number: 1,
                    page: ConcentricTransition(),
                  ),
                  RouteText(
                    text: "Odometer",
                    number: 2,
                    page: OdometerTest(),
                  ),
                  RouteText(
                    text: "StaggeredGridView",
                    number: 3,
                    page: StaggeredGridViewExample(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                'Widget Animation',
                style: AppTextStyle.body1(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  RouteText(
                    text: "Matrix4 Rotation",
                    number: 1,
                    page: TestMatrixSimple(),
                  ),
                  RouteText(
                    text: "Drawer",
                    number: 2,
                    page: TestDrawer(),
                  ),
                  RouteText(
                    text: "Elastic Drawer",
                    number: 3,
                    page: TestElastic(),
                  ),
                  RouteText(
                    text: "Count Numbers",
                    number: 4,
                    page: TestRunNum(),
                  ),
                  RouteText(
                    text: "Curve NavBar",
                    number: 4,
                    page: TestCurveNavBar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
