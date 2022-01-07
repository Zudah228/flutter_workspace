import 'package:flutter/material.dart';
import 'dart:async';

final _overlayEntry = OverlayEntry(
  builder: (_) => const OverlayToast(),
);

void showOverlayDialog(BuildContext context) {
  if (_overlayEntry.mounted) _overlayEntry.remove();

  Navigator.of(context).overlay?.insert(_overlayEntry);

  Timer(const Duration(seconds: 2), () {
    if (_overlayEntry.mounted) _overlayEntry.remove();
  });
}

class OverlayToast extends StatelessWidget {
  const OverlayToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('overlay で閉じる'),
      actions: [
        TextButton(
          onPressed: () {
            _overlayEntry.remove();
          },
          child: const Text('閉じる'),
        )
      ],
    );
  }
}
