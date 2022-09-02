import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/helper/config/themes/app_text_style.dart';

class ClipperTest extends StatefulWidget {
  const ClipperTest({Key? key}) : super(key: key);

  @override
  State<ClipperTest> createState() => _ClipperTestState();
}

class _ClipperTestState extends State<ClipperTest>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _transitionAni;
  Offset _touchPosition = Offset(0, 1);
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _transitionAni = Tween(
      begin: Offset(0, 0),
      end: _touchPosition,
    ).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _animationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text(
          "Clipper",
          style: AppTextStyle.header1(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1. Rect",
              style: AppTextStyle.body1(),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ClipPath(
                clipper: MyRect(),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "2. Pitagorus Tri",
              style: AppTextStyle.body1(),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ClipPath(
                clipper: MyPiTri(),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "3. Tri",
              style: AppTextStyle.body1(),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ClipPath(
                clipper: MyTri(),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "4. Star",
              style: AppTextStyle.body1(),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                color: Colors.red,
                child: ClipPath(
                  clipper: MyStar(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "4. Polygon",
              style: AppTextStyle.body1(),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: ClipPath(
                  clipper: MyPolygon(7),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "5. Curve(QuadraticBezier)",
              style: AppTextStyle.body1(),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(
                children: [
                  AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return ClipPath(
                          clipper: MyCurve(
                            _touchPosition,
                          ),
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.amberAccent,
                          ),
                        );
                      }),
                  SlideTransition(
                    position: _transitionAni,
                    child: GestureDetector(
                      onPanDown: (details) {
                        print(_transitionAni.value);
                        _touchPosition = Offset(
                          details.globalPosition.dx,
                          (details.globalPosition.dy - 600).clamp(0, 200),
                        );

                        print(_touchPosition);

                        _animationController.forward();
                      },
                      onPanUpdate: (details) {
                        print(_transitionAni.value);
                        _touchPosition = Offset(
                          details.globalPosition.dx,
                          (details.globalPosition.dy - 600).clamp(0, 200),
                        );

                        print(_touchPosition);

                        _animationController.forward();
                      },
                      child: Transform.translate(
                        offset: _transitionAni.value,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class MyRect extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyPiTri extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyTri extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyStar extends CustomClipper<Path> {
  MyStar(this.numberOfPoints);

  /// The number of points of the star
  final int numberOfPoints;
  @override
  Path getClip(Size size) {
    double width = size.height;
    double halfWidth = width / 2;
    double bigRadius = halfWidth;

    double radius = halfWidth / 2;
    num degreesPerStep = _degToRad(360 / numberOfPoints);
    double halfDegreesPerStep = degreesPerStep / 2;

    double max = 2 * math.pi;

    Path path = Path();

    path.moveTo(halfWidth, 0);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth - bigRadius * math.sin(step),
          halfWidth - bigRadius * math.cos(step));
      path.lineTo(halfWidth - radius * math.sin(step + halfDegreesPerStep),
          halfWidth - radius * math.cos(step + halfDegreesPerStep));
    }

    path.close();

    return path;
  }

  num _degToRad(deg) => deg * (math.pi / 180);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    MyStar oldie = oldClipper as MyStar;
    return numberOfPoints != oldie.numberOfPoints;
  }
}

class MyPolygon extends CustomClipper<Path> {
  MyPolygon(this.numberOfPoints);

  /// The number of points of the star
  final int numberOfPoints;
  @override
  Path getClip(Size size) {
    double width = size.height;
    double halfWidth = width / 2;
    double bigRadius = halfWidth;

    double radius = halfWidth / 2;
    num degreesPerStep = _degToRad(360 / numberOfPoints);
    double halfDegreesPerStep = degreesPerStep / 2;

    double max = 2 * math.pi;

    Path path = Path();

    path.moveTo(halfWidth, 0);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth - radius * math.sin(step) * 2,
          halfWidth - radius * math.cos(step) * 2);
    }

    path.close();

    return path;
  }

  num _degToRad(deg) => deg * (math.pi / 180);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    MyStar oldie = oldClipper as MyStar;
    return numberOfPoints != oldie.numberOfPoints;
  }
}

class MyCurve extends CustomClipper<Path> {
  Offset _touchPosition;
  MyCurve(this._touchPosition);
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          _touchPosition.dx, _touchPosition.dy, size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
