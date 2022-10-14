// Flutter imports:
import 'package:flutter/material.dart';

class AlertSnackBar extends SnackBar {
  AlertSnackBar({
    Key? key,
    required String text,
    required VoidCallback hideSnackBar,
    Color? backgroundColor,
  }) : super(
            key: key,
            content: Text(text),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
                label: '閉じる', textColor: Colors.white, onPressed: hideSnackBar),
            backgroundColor: backgroundColor);

  static void show(ScaffoldMessengerState state,
      {required String text, Color? backgroundColor}) {
    state.showSnackBar(AlertSnackBar(
      text: text,
      hideSnackBar: state.clearSnackBars,
      backgroundColor: backgroundColor,
    ));
  }
}
