import 'package:flutter/material.dart';
import 'package:practice_ui/screen/sockShop/viewSocks.dart';
import 'package:practice_ui/screen/splashAndLogin/fadeAnimation.dart';

class SocksShop extends StatefulWidget {
  const SocksShop({Key? key}) : super(key: key);

  @override
  State<SocksShop> createState() => _SocksShopState();
}

class _SocksShopState extends State<SocksShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeAnimation(
              1.0,
              Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.only(right: 25, left: 25, top: 60),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(255, 250, 182, 1),
                      Color.fromRGBO(255, 239, 78, 1),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      1.0,
                      Image.asset(
                        "assets/images/menu.png",
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: FadeAnimation(
                            1.2,
                            const Text(
                              'Best Online \nSocks Collection',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(97, 90, 90, 1)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: FadeAnimation(
                            1.3,
                            Image.asset(
                              "assets/images/header-socks.png",
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: FadeAnimation(
                1.3,
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(214, 214, 214, 1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FadeAnimation(
                        1.2,
                        const Text(
                          'Choose \na category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(97, 90, 90, 1),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            FadeAnimation(
                              1.2,
                              FilledButton(
                                onPressed: () {},
                                child: const Text(
                                  'Adult',
                                  style: TextStyle(
                                    color: Color.fromRGBO(251, 53, 105, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            FadeAnimation(
                              1.3,
                              FilledButton(
                                onPressed: () {},
                                child: const Text(
                                  'Children',
                                  style: TextStyle(
                                    color: Color.fromRGBO(97, 90, 90, 0.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20, left: 20),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(
                    1.3,
                    makeCard(
                      context: context,
                      startColor: const Color.fromRGBO(251, 121, 155, 1),
                      endColor: const Color.fromRGBO(251, 53, 105, 1),
                      image: 'assets/images/socks-one.png',
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    makeCard(
                      context: context,
                      startColor: const Color.fromRGBO(203, 251, 255, 1),
                      endColor: const Color.fromRGBO(81, 223, 234, 1),
                      image: 'assets/images/socks-two.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeCard({context, startColor, endColor, image}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, _createRoute());
      },
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [startColor, endColor],
            ),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(214, 214, 214, 1),
                  blurRadius: 10,
                  offset: Offset(5, 10))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const ViewSocks(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: 0.0, end: 1.0).chain(
        CurveTween(
          curve: Curves.easeInOut,
        ),
      );
      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}
