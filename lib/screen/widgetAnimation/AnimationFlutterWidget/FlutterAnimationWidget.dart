import 'package:flutter/material.dart';
import 'package:practice_ui/helper/utility.dart';
import 'package:practice_ui/screen/widgetAnimation/AnimationFlutterWidget/component.dart';
import 'package:practice_ui/screen/widgetAnimation/AnimationFlutterWidget/widget/AlignAni.dart';
import 'package:practice_ui/screen/widgetAnimation/AnimationFlutterWidget/widget/ContainerAni.dart';
import 'package:practice_ui/screen/widgetAnimation/AnimationFlutterWidget/widget/CrossFadeAni.dart';
import 'package:practice_ui/screen/widgetAnimation/AnimationFlutterWidget/widget/FractionSizeAni.dart';
import 'package:practice_ui/screen/widgetAnimation/AnimationFlutterWidget/widget/GridAni.dart';
import 'package:practice_ui/screen/widgetAnimation/AnimationFlutterWidget/widget/TextAni.dart';

class FlutterAnimationWidget extends StatefulWidget {
  const FlutterAnimationWidget({super.key});

  @override
  State<FlutterAnimationWidget> createState() => _FlutterAnimationWidgetState();
}

class _FlutterAnimationWidgetState extends State<FlutterAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MyUtility(context).size.height,
        child: ListView(
          children: [
            AnimationComponent(
              controller: controller,
              header: 'Animated Align',
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return AlignAni(
                    value: controller.value,
                  );
                },
              ),
            ),
            AnimationComponent(
              controller: controller,
              header: 'Animated Container',
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return ContainerAni(
                    value: controller.value,
                  );
                },
              ),
            ),
            AnimationComponent(
              controller: controller,
              header: 'Animated Container',
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return CrossFadeAni(
                    value: controller.value,
                  );
                },
              ),
            ),
            AnimationComponent(
              controller: controller,
              header: 'Animated Text',
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return TextAni(
                    value: controller.value,
                  );
                },
              ),
            ),
            AnimationComponent(
              controller: controller,
              header: 'Animated Fractionally SizedBox',
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return FractionSizeAni(
                    value: controller.value,
                  );
                },
              ),
            ),
            AnimationComponent(
              controller: controller,
              header: 'Animated Grid',
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return GrdiAni(
                    value: controller.value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
