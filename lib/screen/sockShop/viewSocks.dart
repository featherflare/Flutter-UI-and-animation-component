import 'package:flutter/material.dart';
import 'package:practice_ui/screen/splashAndLogin/fadeAnimation.dart';

class ViewSocks extends StatefulWidget {
  const ViewSocks({Key? key}) : super(key: key);

  @override
  State<ViewSocks> createState() => _ViewSocksState();
}

class _ViewSocksState extends State<ViewSocks> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mediaQuery.size.height / 3,
            child: FadeAnimation(
              1.2,
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(251, 121, 155, 1),
                      Color.fromRGBO(251, 53, 105, 1)
                    ],
                  ),
                ),
                child: Transform.translate(
                  offset: const Offset(0, -30),
                  child: FadeAnimation(
                    1.3,
                    Image.asset(
                      'assets/images/details-page-header.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height / 1.4,
            child: FadeAnimation(
              1.2,
              Container(
                padding: const EdgeInsets.all(25.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                        1.3,
                        const Text(
                          'Ranger Sport',
                          style: TextStyle(
                            color: Color.fromRGBO(97, 90, 90, .54),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1.3,
                        const Text(
                          "Ankle Men's Athletic Socks",
                          style: TextStyle(
                            color: Color.fromRGBO(97, 90, 90, 1),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.4,
                        const Text(
                          "Ranger sport socks are a fusion of materials of the sturdiest quality and versatile design that suits all purposes. Each pair of Ranger socks is knitted from 100% combed cotton yarn running along a reinforced 2-Ply core polyester based elastic through out the socks.",
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.54),
                            height: 1.4,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          FadeAnimation(
                            1.2,
                            Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: Colors.red,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.3,
                            Container(
                              width: 25,
                              height: 25,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(251, 53, 105, 1),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.3,
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(81, 234, 234, 1),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                        1.2,
                        const Text(
                          'More option',
                          style: TextStyle(
                            color: Color.fromRGBO(97, 90, 90, .54),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            FadeAnimation(
                              1.3,
                              AspectRatio(
                                aspectRatio: 3.2 / 1,
                                child: Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          224, 224, 224, 1),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 56,
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color:
                                              Color.fromRGBO(251, 53, 105, 1),
                                        ),
                                        child: Image.asset(
                                            'assets/images/socks-icon.png'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const <Widget>[
                                          Text(
                                            'Ankle Length Socks',
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(97, 90, 90, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            '23,345',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  97, 90, 90, .7),
                                              fontSize: 13,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              1.4,
                              AspectRatio(
                                aspectRatio: 3.6 / 1,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            224, 224, 224, 1)),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 56,
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color:
                                              Color.fromRGBO(81, 234, 234, 1),
                                        ),
                                        child: Image.asset(
                                            'assets/images/socks-icon-left.png'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const <Widget>[
                                          Text(
                                            'Quarter Length Socks',
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(97, 90, 90, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            '23,345',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  97, 90, 90, .7),
                                              fontSize: 13,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                          1.5,
                          Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(224, 224, 224, 1),
                                  blurRadius: 10,
                                  offset: Offset(0, 10),
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(251, 121, 155, 1),
                                  Color.fromRGBO(251, 53, 105, 1)
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: const <Widget>[
                                    Text(
                                      '\$14.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '54',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'Pay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
