import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'dart:async';

Future<void> showFlutterToast(BuildContext context) async {
  final fToast = FToast();
  fToast.init(context);

  fToast.showToast(
    toastDuration: const Duration(seconds: 2),
    fadeDuration: 100,
    gravity: ToastGravity.CENTER,
    child: FlutterToastBottom(
      hideToast: () {
        fToast.removeCustomToast();
      },
    ),
  );
}

class FlutterToastBottom extends StatelessWidget {
  const FlutterToastBottom({Key? key, required this.hideToast})
      : super(key: key);
  final VoidCallback? hideToast;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('flutter_toast で開いたよ'),
      actions: [
        TextButton(
          onPressed: hideToast,
          child: const Text('閉じる'),
        )
      ],
    );
  }
}
