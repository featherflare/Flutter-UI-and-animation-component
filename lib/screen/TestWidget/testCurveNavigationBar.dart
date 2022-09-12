import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestCurveNavBar extends StatefulWidget {
  const TestCurveNavBar({Key? key}) : super(key: key);

  @override
  State<TestCurveNavBar> createState() => _TestCurveNavBarState();
}

class _TestCurveNavBarState extends State<TestCurveNavBar> {
  int _page = 0;
  GlobalKey<_CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> items = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
    Icon(Icons.call_split, size: 30),
    Icon(Icons.perm_identity, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: items,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _page.toString(),
                textScaleFactor: 10.0,
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final _CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(
                  primaryColor: Colors.white,
                  secondaryColor: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _indicator(bool isActive, Color primaryColor, Color secondaryColor) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 50 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? primaryColor : secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator({
    Color primaryColor = Colors.black,
    Color secondaryColor = Colors.grey,
  }) {
    List<Widget> indicators = [];
    for (int i = 0; i < items.length; i++) {
      if (_page == i) {
        indicators.add(_indicator(true, primaryColor, secondaryColor));
      } else {
        indicators.add(_indicator(false, primaryColor, secondaryColor));
      }
    }
    return indicators;
  }
}

typedef _LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final double height;
  final List<Widget> items;
  final int index;
  final Color color;
  final Color? buttonBackgroundColor;
  final Curve animationCurve;
  final Duration animationDuration;
  final ValueChanged<int>? onTap;
  final _LetIndexPage letIndexChange;
  final double elevation;

  CurvedNavigationBar({
    Key? key,
    this.backgroundColor = Colors.blueAccent,
    this.height = 75.0,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.onTap,
    _LetIndexPage? letIndexChange,
    this.elevation = 10,
  })  : letIndexChange = letIndexChange ?? ((_) => true),
        assert(items != null),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0),
        super(key: key);

  @override
  State<CurvedNavigationBar> createState() => _CurvedNavigationBarState();
}

class _CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  late int _length;
  late double _pos;
  late Widget _icon;
  double _buttonHide = 0;
  int _endingIndex = 0;
  late AnimationController _animationController;
  late double _startingPos;

  @override
  void initState() {
    super.initState();
    _length = widget.items.length;
    _pos = widget.index / _length;
    _icon = widget.items[widget.index];
    _startingPos = widget.index / _length;
    _animationController = AnimationController(
      vsync: this,
      value: _pos,
    )..addListener(() {
        setState(() {
          _pos = _animationController.value;
          final endingPos = _endingIndex / widget.items.length;
          final middle = (endingPos + _startingPos) / 2;
          if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
            _icon = widget.items[_endingIndex];
          }
          _buttonHide =
              (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
        });
      });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Positioned(
          //   bottom: -40 - (75.0 - widget.height),
          //   child: Material(
          //     elevation: widget.elevation,
          //     color: widget.buttonBackgroundColor ?? widget.color,
          //     type: MaterialType.circle,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: widget.items[3],
          //     ),
          //   ),
          // ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: CustomPaint(
              painter: NavCustomPainter(
                  _pos, _length, widget.color, Directionality.of(context)),
              child: Container(
                height: 75.0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (75.0 - widget.height),
            child: SizedBox(
                height: 100.0,
                child: Row(
                    children: widget.items.map((item) {
                  return NavButton(
                    onTap: _buttonTap,
                    position: _pos,
                    length: _length,
                    index: widget.items.indexOf(item),
                    child: Center(child: item),
                  );
                }).toList())),
          ),
          Positioned(
            bottom: -40 - (75.0 - widget.height),
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos * size.width
                : null,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: _pos == 0.4
                    ? Offset(
                        0,
                        -(1 - _buttonHide) * 70,
                      )
                    : Offset(
                        0,
                        -(1 - _buttonHide) * 80,
                      ),
                child: Material(
                  elevation: widget.elevation,
                  color: widget.buttonBackgroundColor ?? widget.color,
                  type: MaterialType.circle,
                  child: Transform.scale(
                    scale: _pos == 0.4 ? 1.2 : 1,
                    child: AnimatedPadding(
                      duration: Duration(milliseconds: 100),
                      padding: _pos == 0.4
                          ? const EdgeInsets.all(20.0)
                          : const EdgeInsets.all(8.0),
                      child: _icon,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 30,
          //   child: Material(
          //     elevation: 0,
          //     color: widget.buttonBackgroundColor ?? widget.color,
          //     type: MaterialType.canvas,
          //     borderRadius: BorderRadius.circular(100),
          //     child: Transform.scale(
          //       scale: _pos == 0.4 ? 1.2 : 1,
          //       child: GestureDetector(
          //         onTap: () {
          //           _buttonTap(2);
          //         },
          //         child: Padding(
          //           padding: _pos == 0.4
          //               ? const EdgeInsets.all(20.0)
          //               : const EdgeInsets.all(8.0),
          //           child: Icon(Icons.compare_arrows, size: 40),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index)) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;
  late double size1;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = startingLoc == 0.4 ? 0 : 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
    size1 = startingLoc == 0.4 ? 1 : 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05 * size1,
        loc * size.width,
        size.height * 0.60 * size1,
        (loc + s * 0.50) * size.width,
        size.height * 0.60 * size1,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60 * size1,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05 * size1,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;

  NavButton({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Container(
            height: 75.0,
            child: Transform.translate(
              offset: Offset(
                  0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: child),
            )),
      ),
    );
  }
}
