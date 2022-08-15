import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/screen/pageTransition/dashboard.dart';
import 'package:practice_ui/screen/pageTransition/fadeAnimation.dart';

class PageTransition extends StatefulWidget {
  const PageTransition({Key? key}) : super(key: key);

  @override
  State<PageTransition> createState() => _PageTransitionState();
}

class _PageTransitionState extends State<PageTransition>
    with TickerProviderStateMixin {
  late AnimationController rippleController;
  late AnimationController scaleController;

  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;

  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    rippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.of(context).push(
              _createRoute(),
            );
          }
        },
      );

    rippleAnimation = Tween<double>(
      begin: 80.0,
      end: 90.0,
    ).animate(rippleController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            rippleController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            rippleController.forward();
          }
        },
      );

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0,
    ).animate(scaleController);

    rippleController.forward();

    super.initState();
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(image: 'assets/images/one_4.jpeg'),
          makePage(image: 'assets/images/two_4.jpeg'),
          makePage(image: 'assets/images/three_4.jpeg'),
        ],
      ),
    );
  }

  Widget makePage({image}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              FadeAnimation(
                1,
                const Text(
                  'Exerciese',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "15",
                      style: TextStyle(
                          color: Colors.yellow[400],
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    const Text(
                      "Minutes",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "3",
                      style: TextStyle(
                          color: Colors.yellow[400],
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    const Text(
                      "Exercieses",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 180,
              ),
              FadeAnimation(
                1,
                const Align(
                  child: Text(
                    "Start the morning with your health",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w100),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedBuilder(
                    animation: rippleAnimation,
                    builder: (context, child) => Container(
                      width: rippleAnimation.value,
                      height: rippleAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.4),
                        ),
                        child: InkWell(
                          onTap: () {
                            scaleController.forward();
                          },
                          child: AnimatedBuilder(
                            animation: scaleAnimation,
                            builder: (context, child) => Transform.scale(
                              scale: scaleAnimation.value,
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const DashBoardPage(),
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
