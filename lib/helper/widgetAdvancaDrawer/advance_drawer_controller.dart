import 'dart:async';

import 'package:flutter/material.dart';

class AdvanceDrawerController extends ValueNotifier<AdvancedDrawerValue> {
  AdvanceDrawerController([AdvancedDrawerValue? value])
      : super(value ?? AdvancedDrawerValue.hidden());

  void showDrawer() {
    value = AdvancedDrawerValue.visible();
    notifyListeners();
  }

  void hideDrawer() {
    value = AdvancedDrawerValue.hidden();
    notifyListeners();
  }

  void toggleDrawer() {
    if (value.visible) {
      return hideDrawer();
    }

    return showDrawer();
  }
}

class AdvancedDrawerValue {
  const AdvancedDrawerValue({
    this.visible = false,
  });

  /// Indicates whether drawer visible or not.
  final bool visible;

  /// Create a value with hidden state.
  factory AdvancedDrawerValue.hidden() {
    return const AdvancedDrawerValue();
  }

  /// Create a value with visible state.
  factory AdvancedDrawerValue.visible() {
    return const AdvancedDrawerValue(
      visible: true,
    );
  }
}
