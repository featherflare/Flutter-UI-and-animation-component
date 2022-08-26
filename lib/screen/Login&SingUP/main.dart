import 'package:flutter/material.dart';
import 'package:practice_ui/screen/Login&SingUP/login.dart';
import 'package:practice_ui/screen/Login&SingUP/signUp.dart';
import 'package:practice_ui/screen/e-commerce/Animation/fadeAnimation.dart';

class MainLoginNSignUp extends StatefulWidget {
  const MainLoginNSignUp({Key? key}) : super(key: key);

  @override
  State<MainLoginNSignUp> createState() => _MainLoginNSignUpState();
}

class _MainLoginNSignUpState extends State<MainLoginNSignUp> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          width: double.infinity,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FadeAnimation(
                    1,
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "Automatic identity verification which enables you to verify your identity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
              FadeAnimation(
                1.4,
                Container(
                  height: height / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Illustration.png'),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  FadeAnimation(
                    1.5,
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          _createRoute(const Login3Page()),
                        );
                      },
                      minWidth: double.infinity,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.6,
                    Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            _createRoute(const SignUpPage()),
                          );
                        },
                        minWidth: double.infinity,
                        height: 60,
                        color: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "SignUp",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
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
