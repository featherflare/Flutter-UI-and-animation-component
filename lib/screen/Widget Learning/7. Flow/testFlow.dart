import 'package:flutter/material.dart';
import 'dart:math';

class TestFlow extends StatefulWidget {
  const TestFlow({Key? key}) : super(key: key);

  @override
  State<TestFlow> createState() => _TestFlowState();
}

class _TestFlowState extends State<TestFlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Example'),
      ),
      body: FlowMenu(),
    );
  }
}

const double bottomsize = 80;

class FlowMenu extends StatefulWidget {
  const FlowMenu({Key? key}) : super(key: key);

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  Widget flowMenuItem(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: bottomsize,
        height: bottomsize,
        child: RawMaterialButton(
          fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
          splashColor: Colors.amber[100],
          shape: const CircleBorder(),
          constraints: BoxConstraints.tight(Size(bottomsize, bottomsize)),
          onPressed: () {
            _updateMenu(icon);
            menuAnimation.status == AnimationStatus.completed
                ? menuAnimation.reverse()
                : menuAnimation.forward();
          },
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0, -20),
                child: Text('test'),
              ),
              Transform.translate(
                offset: Offset(0, 10),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children:
          menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      final size = context.size;
      // dx = context.getChildSize(i)!.width * 2;
      context.paintChild(i,
          transform: Matrix4.translationValues(
            160 +
                (cos((pi * 15 / 18) - (pi * i * 15 / 90))) *
                    (menuAnimation.value) *
                    180,
            size.height -
                420 -
                (sin((pi * 15 / 18) - (pi * i * 15 / 90))) *
                    (menuAnimation.value) *
                    180,
            0,
          ));
    }
  }
}
