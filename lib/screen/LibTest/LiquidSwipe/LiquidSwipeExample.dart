import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeExample extends StatefulWidget {
  const LiquidSwipeExample({Key? key}) : super(key: key);

  @override
  State<LiquidSwipeExample> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LiquidSwipeExample> {
  int page = 0;

  late LiquidController liquidController;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      height: double.infinity,
      child: Image.network(
        'https://my4kwallpapers.com/wp-content/uploads/2021/10/Squid-Game-Wallaper-1080x1920-1.jpg',
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: double.infinity,
      child: Image.network(
        'https://w0.peakpx.com/wallpaper/432/1/HD-wallpaper-el-juego-del-calamar-netflix-squid-game.jpg',
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: double.infinity,
      child: Image.network(
        'https://w0.peakpx.com/wallpaper/114/378/HD-wallpaper-squid-game-netflix-electric-blue-magenta-squid-game.jpg',
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: double.infinity,
      child: Image.network(
        'https://fsb.zobj.net/crop.php?r=71AngyTpyXhfPVli-wIddS2vviYpIGCVmHX8EkQbAKyEkqH55ohVtsP3jTs0sWamyX5auRdmNOTnvZb0lBvJG9bwdJ8Zi5wZdGo2JLutBDwV3Amcl9RWiMsHFZD1pgdCA8XsPIR-9FWNAXfy7zjd8IvNcU6j1tYROKs5F1iAP8AldI6AmLrv432iiVCGM6kNl3toGH6NzNTQUxKw',
        fit: BoxFit.cover,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              return LiquidSwipe(
                pages: pages, //pages
                fullTransitionValue: 800, //time
                initialPage: page, //pages index
                slideIconWidget: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                positionSlideIcon: 0.8,
                enableLoop: true,
                liquidController: liquidController,
                waveType: WaveType.circularReveal, //type of transition
                onPageChangeCallback: pageChangeCallback,
                ignoreUserGestureWhileAnimating: true,
                enableSideReveal: true, //enable clip area 15px
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FilledButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: pages.length - 1, duration: 700);
                },
                child: Text("Skip to End"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FilledButton(
                onPressed: () {
                  liquidController.jumpToPage(
                      page: liquidController.currentPage + 1 > pages.length - 1
                          ? 0
                          : liquidController.currentPage + 1);
                },
                child: Text("Next"),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }
}
