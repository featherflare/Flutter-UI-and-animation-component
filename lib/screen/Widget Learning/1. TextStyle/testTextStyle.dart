import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TestTextStyle extends StatefulWidget {
  const TestTextStyle({Key? key}) : super(key: key);

  @override
  State<TestTextStyle> createState() => _TestTextStyleState();
}

class _TestTextStyleState extends State<TestTextStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "letterSpacing",
                style: TextStyle(
                  letterSpacing: 10,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Word Spacing",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 10,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Shadow",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(5.0, 5.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 213, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color(0xff027dfd),
                    Color(0xff4100e0),
                    Color(0xff1cdac5),
                    Color(0xfff2dd22),
                  ],
                ).createShader(
                  bounds,
                ),
                child: const Text(
                  "Word Spacing",
                  style: TextStyle(
                    color: Colors.white, // Mean Opacity
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Baseline(
                baseline: 10,
                baselineType: TextBaseline.ideographic,
                child: const Text(
                  "Baseline",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaskedImage(
                image: AssetImage('assets/images/background-7.jpeg'),
                child: Text(
                  "Image Shader Masked",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaskedImage extends StatelessWidget {
  final ImageProvider image;
  final Widget child;
  const MaskedImage({Key? key, required this.image, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<ui.Image>(
        future: loadImage(),
        builder: (context, snap) => snap.hasData
            ? ShaderMask(
                blendMode: BlendMode.srcATop, //dstATop,srcATop
                shaderCallback: (bounds) => ImageShader(
                  snap.data!,
                  TileMode.clamp,
                  TileMode.clamp,
                  Matrix4.identity().storage,
                ),
                child: child,
              )
            : Container(),
      );

  Future<ui.Image> loadImage() async {
    final completer = Completer<ui.Image>();
    final stream = image.resolve(ImageConfiguration());
    stream.addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));
    return completer.future;
  }
}
