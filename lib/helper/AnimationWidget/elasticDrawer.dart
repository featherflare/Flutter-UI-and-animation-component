import 'package:flutter/material.dart';

const borderWidth = 50.0;
const lineWidth = 5.0;
const touchWidth = 40.0;
const touchRadius = 100.0;

class ElasticDrawerKey {
  static final drawer = GlobalKey<_ElasticDrawerState>();
  static final navigator = GlobalKey<NavigatorState>();
}

class ElasticDrawer extends StatefulWidget {
  /// Color of main page
  final Color mainColor = Colors.white;

  /// Color of drawer page
  final Color drawerColor = Colors.blue;

  /// Width of touch mark (0..1)
  final double markWidth = 1;

  /// Vertical position of touch mark (0..1)
  final double markPosition = 0.95;

  final Widget mainDrawer;
  final Widget secondDrawer;

  ElasticDrawer(
      {Key? key, required this.mainDrawer, required this.secondDrawer})
      : super(key: ElasticDrawerKey.drawer);

  @override
  State<ElasticDrawer> createState() => _ElasticDrawerState();
}

class _ElasticDrawerState extends State<ElasticDrawer>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _firstAnimation;
  late final Animation<double> _clipperAnimation;
  late final Animation<Offset> _secondAnimation;
  bool _isDrawerActive = false;
  bool _slideOn = false;
  Offset? _touchPosition;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _clipperAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticIn,
        parent: _animationController,
      ),
    );

    _firstAnimation = Tween(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _animationController,
      ),
    );

    _secondAnimation = Tween(
      begin: Offset.zero,
      end: const Offset(1, 0),
    ).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _animationController,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  closeElasticDrawer(BuildContext context) {
    if (_animationController.isCompleted) {
      _animation(context);
    }
  }

  void _animation(BuildContext context) {
    _isDrawerActive = false;
    final size = MediaQuery.of(context).size;
    final markPosition = touchRadius +
        widget.markPosition.clamp(0, 1) * (size.height - 2 * touchRadius);
    _touchPosition = Offset(size.width - borderWidth, markPosition);
    _animationController.reverse().then((_) => {
          setState(() {
            _touchPosition = Offset(borderWidth, markPosition);
            _slideOn = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final markWidth = widget.markWidth.clamp(0, 1) * touchWidth;
    final markPosition = touchRadius +
        widget.markPosition.clamp(0, 1) * (size.height - 2 * touchRadius);

    return Stack(
      children: [
        SizedBox.fromSize(
          size: size,
          child: Scaffold(
            backgroundColor: widget.mainColor,
            body: Navigator(
              key: ElasticDrawerKey.navigator,
              onGenerateRoute: (_) =>
                  MaterialPageRoute(builder: (_) => widget.mainDrawer),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: _slideOn ? size.width - lineWidth : lineWidth + borderWidth,
            height: size.height,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return ClipPath(
                  clipper: _CustomClipper(
                    _touchPosition,
                    markWidth,
                    markPosition,
                    _clipperAnimation.value,
                    _isDrawerActive,
                  ),
                  child: Scaffold(
                    backgroundColor: widget.drawerColor,
                    body: _slideOn ? widget.secondDrawer : SizedBox(),
                  ),
                );
              },
            ),
          ),
        ),
        Row(
          children: [
            SlideTransition(
              position: _firstAnimation,
              child: GestureDetector(
                onPanDown: (details) {
                  _isDrawerActive = true;
                  _touchPosition = details.globalPosition;
                  setState(() {});
                },
                onPanUpdate: (details) {
                  _touchPosition = details.globalPosition;
                  setState(() {});
                },
                onPanEnd: (_) {
                  _animation(context);
                },
                child: Container(width: borderWidth, color: Colors.transparent),
              ),
            ),
            Spacer(),
            SlideTransition(
              position: _secondAnimation,
              child: GestureDetector(
                onPanDown: (details) {
                  _slideOn = true;
                  _touchPosition = Offset(
                    details.globalPosition.dx
                        .clamp(0, size.width - borderWidth),
                    details.globalPosition.dy,
                  );
                  setState(() {});
                },
                onPanUpdate: (details) {
                  _touchPosition = Offset(
                    details.globalPosition.dx
                        .clamp(0, size.width - borderWidth),
                    details.globalPosition.dy,
                  );
                  setState(() {});
                },
                onPanEnd: (_) {
                  _touchPosition = Offset(0.0, markPosition);
                  _animationController.forward();
                },
                child: Container(width: borderWidth, color: Colors.transparent),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  Offset? _touchPosition;
  final double _touchWidth;
  final double _markPosition;
  final double _endPosition;
  final bool _isDrawerActive;

  _CustomClipper(
    this._touchPosition,
    this._touchWidth,
    this._markPosition,
    this._endPosition,
    this._isDrawerActive,
  );

  @override
  Path getClip(Size size) {
    _touchPosition ??= Offset(borderWidth, _markPosition);
    final expandFactor = _touchPosition == 0 || _isDrawerActive
        ? 1
        : ((size.width - borderWidth - _touchPosition!.dx) / _touchWidth)
            .clamp(0, 1);

    final path = Path()
      ..moveTo(size.width - lineWidth, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - lineWidth - size.width * _endPosition, size.height)
      ..lineTo(
        size.width - lineWidth - size.width * _endPosition,
        _touchPosition!.dy +
            touchRadius +
            (size.height - _touchPosition!.dy - touchRadius) * expandFactor,
      )
      ..cubicTo(
        _touchPosition!.dx - _touchWidth,
        _touchPosition!.dy,
        _touchPosition!.dx - _touchWidth,
        _touchPosition!.dy,
        size.width - lineWidth - size.width * _endPosition,
        (_touchPosition!.dy - touchRadius) * (1 - expandFactor),
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(_CustomClipper oldClipper) => true;
}

class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xff3cba54));
  }
}

class YellowPage extends StatelessWidget {
  const YellowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xfff4c20d));
  }
}

class RedPage extends StatelessWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xffdb3236));
  }
}
