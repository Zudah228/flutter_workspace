import 'package:flutter/material.dart';
import 'dart:async';

final _overlayEntry =
    OverlayEntry(builder: (_) => const OverlayToastBottom());

void showOverlayToastBottom(BuildContext context) {
  if (_overlayEntry.mounted) _overlayEntry.remove();

  Navigator.of(context).overlay?.insert(_overlayEntry);

  Timer(const Duration(seconds: 2), () {
    if (_overlayEntry.mounted) _overlayEntry.remove();
  });
}

class OverlayToastBottom extends StatelessWidget {
  const OverlayToastBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50.0,
      left: 24.0,
      right: 24.0,
      child: Material(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 24.0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('開いた'),
              TextButton(
                onPressed: () {
                  _overlayEntry.remove();
                },
                child: const Text('閉じる'),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
