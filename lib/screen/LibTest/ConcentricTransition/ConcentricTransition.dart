import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

class ConcentricTransition extends StatefulWidget {
  const ConcentricTransition({Key? key}) : super(key: key);

  @override
  State<ConcentricTransition> createState() => _ConcentricTransitionState();
}

class _ConcentricTransitionState extends State<ConcentricTransition> {
  List<dynamic> pages = [
    {
      'image':
          'https://ouch-cdn2.icons8.com/yIxQmzj1OHH3S9AiIgelaTGdpj3wApWqSqFh80arSEA/rs:fit:784:828/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTMx/L2NmOGIzZmY4LWRh/YjEtNDdiMS1hZGQ4/LWFkMTUwZTQwNzIx/NC5wbmc.png',
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/oEXWmNUZgj3vd_T5XSJe2dTB1GFWIBeJ1QEqRWw76O8/rs:fit:784:748/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMzM1/L2Q3MjMyYzJlLTk0/NTMtNDUzMC1iZTEx/LWQ2MDZiN2RjYmFm/Yy5wbmc.png'
    },
    {
      'image':
          'https://ouch-cdn2.icons8.com/g8bZd-d4qiYuomOBWh3x61II6HlK8Ir2zp_a2cFTcCA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDI4/LzdjMjEyYjgzLTg0/NjQtNDQzMS04NzAz/LTNkNzk1YmUyMzli/MC5wbmc.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        radius: 300,
        verticalPosition: 0.75,
        colors: [
          Colors.white,
          Colors.blueAccent,
          Colors.pinkAccent,
        ],
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        itemBuilder: (index) {
          int pageIndex = (index % pages.length);
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  pages[pageIndex]['image'],
                  width: 300,
                ),
                ClipPath(
                  clipper: ConcentricClipper(
                    progress: 0.0, // from 0.0 to 1.0
                    reverse: false,
                    radius: 300.0,
                    verticalPosition: 0.75,
                  ),
                  child: Container(
                    color: Colors.amberAccent,
                    child: Center(
                      child: MaterialButton(
                        child: const Text("Next"),
                        onPressed: () {
                          if (pageIndex == 0) {
                            Navigator.push(context,
                                ConcentricPageRoute(builder: (ctx) {
                              return const Page1();
                            }));
                          } else if (pageIndex == 1) {
                            Navigator.push(context,
                                ConcentricPageRoute(builder: (ctx) {
                              return const Page2();
                            }));
                          } else if (pageIndex == 2) {
                            Navigator.push(context,
                                ConcentricPageRoute(builder: (ctx) {
                              return const Page3();
                            }));
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
//      appBar: AppBar(title: Text("Page 1")),
      body: Center(
        child: MaterialButton(
          child: const Text("Back"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
//      appBar: AppBar(title: Text("Page 2")),
      body: Center(
        child: MaterialButton(
          child: const Text("Back"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
//      appBar: AppBar(title: Text("Page 2")),
      body: Center(
        child: MaterialButton(
          child: const Text("Back"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
