import 'package:flutter/material.dart';
import 'dart:async';

Future<void> showNavigatorToast(BuildContext context) async {
  try {
    await showDialog(
      context: context,
      builder: (_) => const NavigatorToast()
    ).timeout(const Duration(seconds: 2));

  } on TimeoutException {
    Navigator.pop(context);
  }
}

class NavigatorToast extends StatelessWidget {
  const NavigatorToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('showDialog で開いたよ'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('閉じる'),
        )
      ],
    );
  }
}
