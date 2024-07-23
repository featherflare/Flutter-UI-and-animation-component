import 'package:firebase_auth/firebase_auth.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';
import 'package:practice_ui/helper/utility.dart';
import 'package:practice_ui/screen/Clipper/clipper.dart';
import 'package:practice_ui/screen/Game/firstGame/firstgame.dart';
import 'package:practice_ui/screen/LibTest/ConcentricTransition/ConcentricTransition.dart';
import 'package:practice_ui/screen/LibTest/LiquidSwipe/LiquidSwipeExample.dart';
import 'package:practice_ui/screen/LibTest/Odometer/Odometer.dart';
import 'package:practice_ui/screen/LibTest/StaggeredGridViewExample/StaggeredGridViewExample.dart';
import 'package:practice_ui/screen/Login&SingUP/main.dart';
import 'package:practice_ui/screen/SwapCard/TestSwapCard.dart';
import 'package:practice_ui/screen/TestWidget/testCurveNavigationBar.dart';
import 'package:practice_ui/screen/TestWidget/testDrawer.dart';
import 'package:practice_ui/screen/TestWidget/testElastic.dart';
import 'package:practice_ui/screen/TestWidget/testRunNum.dart';
import 'package:practice_ui/screen/Widget%20Learning/1.%20TextStyle/testTextStyle.dart';
import 'package:practice_ui/screen/Widget%20Learning/10.%20PhysicalModel/testPhysicalModel.dart';
import 'package:practice_ui/screen/Widget%20Learning/11.%20ImageFiltered/testImageFiltered.dart';
import 'package:practice_ui/screen/Widget%20Learning/12.%20ListTile/testListTile.dart';
import 'package:practice_ui/screen/Widget%20Learning/13.%20InteractiveViewer/testInteractioveViewer.dart';
import 'package:practice_ui/screen/Widget%20Learning/14.%20ListWheelScrollView/testListWheelScrollView.dart';
import 'package:practice_ui/screen/Widget%20Learning/15.%20AnimatedCrossFade/testAnimatedCrossFade.dart';
import 'package:practice_ui/screen/Widget%20Learning/16.%20IndexedStack/testIndexedStack.dart';
import 'package:practice_ui/screen/Widget%20Learning/17.%20AnimatedSwitcher/testAnimatedSwitcher.dart';
import 'package:practice_ui/screen/Widget%20Learning/18.%20ReorderableListView/testReorderableListView.dart';
import 'package:practice_ui/screen/Widget%20Learning/2.%20AutoComplete/testAutoComplete.dart';
import 'package:practice_ui/screen/Widget%20Learning/3.%20NavigationRail/testNavigationRail.dart';
import 'package:practice_ui/screen/Widget%20Learning/4.%20FocusableActionDetector/testFocusableActionDetector.dart';
import 'package:practice_ui/screen/Widget%20Learning/5.%20ScaffoldMessenger/testScaffoldMessenger.dart';
import 'package:practice_ui/screen/Widget%20Learning/6.%20DropDown/testDropDown.dart';
import 'package:practice_ui/screen/Widget%20Learning/7.%20Flow/testFlow.dart';
import 'package:practice_ui/screen/Widget%20Learning/8.%20RefreshIndicator/testRefreshIndicator.dart';
import 'package:practice_ui/screen/Widget%20Learning/9.%20RotatedBox/testRotatedBox.dart';
import 'package:practice_ui/screen/appWithIndicator/appWithIndicator.dart';
import 'package:practice_ui/screen/buttonAnimation/buttonAnimation.dart';
import 'package:practice_ui/screen/carousel/carousel.dart';
import 'package:practice_ui/screen/chatApp/screens/auth.dart';
import 'package:practice_ui/screen/chatApp/screens/chat.dart';
import 'package:practice_ui/screen/chatApp/screens/splash.dart';
import 'package:practice_ui/screen/e-commerce/e-commerce.dart';
import 'package:practice_ui/screen/expenseTrackerApp/expenseTracker.dart';
import 'package:practice_ui/screen/favoritePlacesApp/screens/places.dart';
import 'package:practice_ui/screen/flipCardGame/FlipCardMemoryGame.dart';
import 'package:practice_ui/screen/foodDelivery/foodDelivery.dart';
import 'package:practice_ui/screen/googleMap/GoogleMap.dart';
import 'package:practice_ui/screen/googleMap/pages/map_circles.dart';
import 'package:practice_ui/screen/homeService/page/start.dart';
import 'package:practice_ui/screen/inspiration/inspiration.dart';
import 'package:practice_ui/screen/loginPage/loginPage1.dart';
import 'package:practice_ui/screen/loginPage/loginPage2.dart';
import 'package:practice_ui/screen/matrix4Test/matrix4Test1.dart';
import 'package:practice_ui/screen/mealsApp/screens/categories.dart';
import 'package:practice_ui/screen/mealsApp/screens/tabs.dart';
import 'package:practice_ui/screen/pageAnimation/pageAnimation.dart';
import 'package:practice_ui/screen/pageTransition/pageTransition.dart';
import 'package:practice_ui/screen/partyAndSplash/partyAndSplash.dart';
import 'package:practice_ui/screen/rippleAnimation/rippleAnimation.dart';
import 'package:practice_ui/screen/shoeShop/shoeShop.dart';
import 'package:practice_ui/screen/sockShop/sockShop.dart';
import 'package:practice_ui/screen/splashAndLogin/splashAndLogin.dart';
import 'package:practice_ui/screen/todoApp/keys.dart';
import 'package:practice_ui/screen/travel/travel.dart';
import 'package:practice_ui/screen/userProfile/userProfile.dart';
import 'package:practice_ui/screen/wallet/wallet.dart';
import 'package:practice_ui/screen/webView/webView.dart';
import 'package:practice_ui/screen/widgetAnimation/widgetAnimation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _isOpen = [
    true,
    true,
    true,
    true,
    true,
  ];
  final game = FirstGame();

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

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
            ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 500),
              dividerColor: Colors.grey.shade50,
              elevation: 1,
              expandedHeaderPadding: const EdgeInsets.all(0),
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isOpen) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Text(
                        'UI Animate Practice',
                        style: AppTextStyle.body1(),
                      ),
                    );
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        text: "Wallet App",
                        number: 20,
                        page: WalletApp(),
                      ),
                      const RouteText(
                        text: "Clipper Practice",
                        number: 21,
                        page: ClipperTest(),
                      ),
                      const RouteText(
                        text:
                            "Expense(Array Function & Create Chart without lib)",
                        number: 22,
                        page: Expenses(),
                      ),
                      const RouteText(
                        text: "Todo App(Key Uesable)",
                        number: 23,
                        page: Keys(),
                      ),
                      const RouteText(
                        text: "Meal App(Navigate & Animation)",
                        number: 24,
                        page: TabsScreen(),
                      ),
                      const RouteText(
                        text: "Favorite Place App(Device Service)",
                        number: 25,
                        page: PlacesSceen(),
                      ),
                      RouteText(
                        text: "Chat App(Firebase testing)",
                        number: 26,
                        page: StreamBuilder(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SplashScreen();
                            }
                            if (snapshot.hasData) {
                              return const ChatScreen();
                            }

                            return const AuthScreen();
                          },
                        ),
                      ),
                    ],
                  ),
                  isExpanded: _isOpen[0],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isOpen) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Text(
                        'Widget Learning',
                        style: AppTextStyle.body1(),
                      ),
                    );
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      RouteText(
                        text: "TextStyle",
                        number: 1,
                        page: TestTextStyle(),
                      ),
                      RouteText(
                        text: "AutoComplete",
                        number: 2,
                        page: TestAutoComplete(),
                      ),
                      RouteText(
                        text: "NavigationRail",
                        number: 3,
                        page: TestNavigationRail(),
                      ),
                      RouteText(
                        text: "FocusableActionDetector",
                        number: 4,
                        page: TestFAD(),
                      ),
                      RouteText(
                        text: "ScaffoldMessenger",
                        number: 5,
                        page: TestScaffoldMessenger(),
                      ),
                      RouteText(
                        text: "DropdownButton",
                        number: 6,
                        page: TestDropDown(),
                      ),
                      RouteText(
                        text: "Flow",
                        number: 7,
                        page: TestFlow(),
                      ),
                      RouteText(
                        text: "RefreshIndicator",
                        number: 8,
                        page: TestRefreshIndicator(),
                      ),
                      RouteText(
                        text: "RotatedBox",
                        number: 9,
                        page: TestRotatedBox(),
                      ),
                      RouteText(
                        text: "PhysicalModel ",
                        number: 10,
                        page: TestPhysicalModel(),
                      ),
                      RouteText(
                        text: "ImageFiltered",
                        number: 11,
                        page: TestImageFiltered(),
                      ),
                      RouteText(
                        text: "ListTile",
                        number: 12,
                        page: TestListTile(),
                      ),
                      RouteText(
                        text: "InteractiveViewer",
                        number: 13,
                        page: TestInteractiveViewer(),
                      ),
                      RouteText(
                        text: "ListWheelScrollView",
                        number: 14,
                        page: TestListWheelScrollView(),
                      ),
                      RouteText(
                        text: "AnimatedCrossFade",
                        number: 15,
                        page: TestAnimatedCrossFade(),
                      ),
                      RouteText(
                        text: "IndexedStack",
                        number: 16,
                        page: TestIndexedStack(),
                      ),
                      RouteText(
                        text: "AnimatedSwitcher",
                        number: 17,
                        page: TestAnimatedSwitcher(),
                      ),
                      RouteText(
                        text: "ReorderableListView",
                        number: 18,
                        page: TestReorderableListView(),
                      ),
                    ],
                  ),
                  isExpanded: _isOpen[1],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isOpen) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Text(
                        'Package Interest',
                        style: AppTextStyle.body1(),
                      ),
                    );
                  },
                  body: Column(
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
                      RouteText2(
                        text: "LiquidSwipe",
                        number: 4,
                        page: LiquidSwipeExample(),
                      ),
                    ],
                  ),
                  isExpanded: _isOpen[2],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isOpen) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Text(
                        'Widget Animation',
                        style: AppTextStyle.body1(),
                      ),
                    );
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      RouteText(
                        text: "Widget Animation",
                        number: 0,
                        page: WidgetAni(),
                      ),
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
                        text: "Curve NavBar & Dot Indicator",
                        number: 5,
                        page: TestCurveNavBar(),
                      ),
                      RouteText(
                        text: "SwapCard",
                        number: 6,
                        page: TestSwapCard(),
                      ),
                    ],
                  ),
                  isExpanded: _isOpen[3],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isOpen) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Text(
                        'Game',
                        style: AppTextStyle.body1(),
                      ),
                    );
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const RouteText(
                        text: "FlipCard Memory Game",
                        number: 1,
                        page: FlipCardGameHOme(),
                      ),
                      RouteText(
                        text: "Firstgame",
                        number: 2,
                        page: GameWidget(game: game),
                      ),
                      RouteText(
                        text: "WebView",
                        number: 2,
                        page: WebViewPage(controller: controller),
                      ),
                    ],
                  ),
                  isExpanded: _isOpen[4],
                ),
              ],
              expansionCallback: (i, isOpen) => setState(() {
                _isOpen[i] = !isOpen;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
