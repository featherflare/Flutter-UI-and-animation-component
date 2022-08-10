import 'dart:js';

import 'package:flutter/material.dart';

mixin CreateRoute on StatelessWidget {
  Route _createRoute(items) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => items,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: 1.0, end: 0.0).chain(
          CurveTween(
            curve: Curves.easeInOut,
          ),
        );
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
