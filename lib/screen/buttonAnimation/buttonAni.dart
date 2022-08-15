import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BtnAni extends StatefulWidget {
  final Color primaryColor;
  final Color darkPrimaryColor;

  BtnAni(this.primaryColor, this.darkPrimaryColor);

  @override
  State<BtnAni> createState() => _BtnAniState();
}

class _BtnAniState extends State<BtnAni> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleAnimationController;
  late AnimationController _fadeAnimationController;

  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  double buttonWidth = 200.0;
  double scale = 1.0;
  bool animationComplete = false;
  double barColorOpacity = 0.6;
  bool animationStart = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(_fadeAnimationController);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(_scaleAnimationController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _scaleAnimationController.reverse();
            _fadeAnimationController.forward();
            _animationController.forward();
          }
        },
      );

    _animation = Tween<double>(
      begin: 0.0,
      end: buttonWidth,
    ).animate(_animationController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            setState(
              () {
                animationComplete = true;
                barColorOpacity = 0.0;
              },
            );
          }
        },
      );
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
    _fadeAnimationController.dispose();
    _scaleAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _scaleAnimationController,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: InkWell(
              onTap: () {
                _scaleAnimationController.forward();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        child: animationComplete == false
                            ? Text(
                                'Download',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            : Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _fadeAnimationController,
                      builder: (context, child) => Container(
                        width: _fadeAnimation.value,
                        height: 50,
                        decoration: BoxDecoration(
                          color: widget.darkPrimaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Positioned(
            left: 0,
            top: 0,
            width: _animation.value,
            height: 50,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: barColorOpacity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
