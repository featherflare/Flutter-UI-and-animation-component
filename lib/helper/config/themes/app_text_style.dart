import 'package:flutter/material.dart';
import 'package:practice_ui/helper/config/themes/colors_scheme.dart';

class AppTextStyle {
  static TextStyle header1({Color? color}) {
    return TextStyle(
      fontSize: 32,
      color: color ?? ThemeColors.black,
    );
  }

  static TextStyle body1({Color? color}) {
    return TextStyle(
      fontSize: 24,
      color: color ?? ThemeColors.black,
    );
  }

  static TextStyle body2({Color? color}) {
    return TextStyle(
      fontSize: 32,
      color: color ?? ThemeColors.black,
    );
  }

  static TextStyle body3({Color? color}) {
    return TextStyle(
      fontSize: 48,
      color: color ?? ThemeColors.black,
      fontWeight: FontWeight.w600,
    );
  }
}
