import 'package:flutter/material.dart';
import 'dart:async';

final _overlayEntry =
    OverlayEntry(builder: (_) => const _Toast());

void showToast(BuildContext context) {
  if (_overlayEntry.mounted) _overlayEntry.remove();

  Navigator.of(context).overlay?.insert(_overlayEntry);

  Timer(const Duration(seconds: 2), () {
    if (_overlayEntry.mounted) _overlayEntry.remove();
  });
}

class _Toast extends StatefulWidget {
  const _Toast({Key? key}) : super(key: key);

  @override
  State<_Toast> createState() =>
      _ToastState();
}

class _ToastState extends State<_Toast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  final _tween = TweenSequence<Alignment>([
     TweenSequenceItem(
       tween: Tween(begin: const Alignment(0.0, 2.0), end: const Alignment(0.0, 0.9))
           .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
       weight: 2,
     ),
     TweenSequenceItem(
       tween: ConstantTween(const Alignment(0.0, 0.9)),
       weight: 10,
     ),
     TweenSequenceItem(
       tween: Tween(begin: const Alignment(0.0, 0.9), end: const Alignment(0.0, 2.0),)
           .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
       weight: 2,
     ),
   ]);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlignTransition(
      alignment: _tween.animate(_controller),
      child: Material(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                )
              ]),
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
