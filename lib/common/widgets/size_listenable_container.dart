import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

/// Size の変化を通知する
///
/// createRenderObject で、
/// performLayout() 実行時に、サイズに変更があった場合にコールバックを実行する、独自の RenderObject クラスを返す
class SizeListenableContainer extends SingleChildRenderObjectWidget {
  const SizeListenableContainer({
    Key? key,
    required Widget child,
    required this.onSizeChanged,
  }) : super(key: key, child: child);

  final void Function(Size size) onSizeChanged;

  @override
  SizeListenableRenderObject createRenderObject(BuildContext context) {
    return SizeListenableRenderObject(
      onSizeChanged: onSizeChanged,
    );
  }
}

class SizeListenableRenderObject extends RenderProxyBox {
  SizeListenableRenderObject({
    required this.onSizeChanged,
  }) : super();

  final void Function(Size size) onSizeChanged;

  Size? _oldSize;

  @override
  void performLayout() {
    super.performLayout();

    final Size size = this.size;

    if (size != _oldSize) {
      _oldSize = size;
      _callback(size);
    }
  }

  void _callback(Size size) {
    SchedulerBinding.instance.addPostFrameCallback((Duration _) {
      onSizeChanged(size);
    });
  }
}
