import 'package:flutter/material.dart';
import 'dart:async';

Future<void> showNavigatorToast(BuildContext context) async {
  try {
    await showDialog(
      context: context,
      builder: (_) => const _Toast()
    ).timeout(const Duration(seconds: 2));

  } on TimeoutException {
    Navigator.pop(context);
  }
}

class _Toast extends StatelessWidget {
  const _Toast({Key? key}) : super(key: key);

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
