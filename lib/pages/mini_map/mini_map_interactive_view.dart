import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/widgets/size_listenable_container.dart';

/// スクローラブルな画面で使うことを想定していない
class MiniMapInteractiveView extends StatefulWidget {
  const MiniMapInteractiveView({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  MiniMapInteractiveViewState createState() => MiniMapInteractiveViewState();
}

class MiniMapInteractiveViewState extends State<MiniMapInteractiveView> {
  final _transformationController = TransformationController();

  static const double _kMinimapMaxSize = 142;
  _inscribedSquareScale() => 0.5 * math.sqrt(2);

  final _viewerKey = GlobalKey();
  Size? _viewerSize;
  Matrix4 get _viewerMatrix => _transformationController.value;
  double get _viewerScale => _viewerMatrix.storage[0];
  double get _viewerInvertedScale => (1 / _viewerScale);
  double get _viewerX => (_viewerMatrix.getRow(0)[3] / _viewerScale) * -1;
  double get _viewerY => (_viewerMatrix.getRow(1)[3] / _viewerScale) * -1;

  static const _kDefaultScale = 1.0;
  static const _kZoomInScale = 1.6;
  bool get _isZoom => _viewerScale == _kZoomInScale;

  void reset() {
    _transformationController.value = Matrix4.identity();
  }

  void toggleZoom() {
    if (_viewerScale == _kDefaultScale) {
      _transformationController.value =
          _transformationController.value.clone().scaled(_kZoomInScale);
    } else {
      _transformationController.value = Matrix4.identity();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _viewerSize = _viewerKey.currentContext?.size;
        });

        _transformationController.addListener(() {
          setState(() {});
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildMiniMap() {
      if (_viewerSize == null) {
        return const SizedBox.shrink();
      }

      return _UnconstrainedAspectRatio(
        aspectRatio: _viewerSize!.aspectRatio,
        child: Transform.scale(
          scale: _inscribedSquareScale(),
          child: LayoutBuilder(
            builder: (context, c) {
              final xRatio = _viewerSize!.width / c.minWidth;
              final yRatio = _viewerSize!.height / c.minHeight;

              final scale = _viewerInvertedScale;
              final x = _viewerX / xRatio;
              final y = _viewerY / yRatio;

              return Stack(
                children: [
                  Positioned.fill(
                    child: widget.child,
                  ),
                  Visibility(
                    visible: _isZoom,
                    child: Positioned.fill(
                      child: Transform(
                        transform: Matrix4(
                          // row0
                          scale, 0, 0, 0,

                          // row1
                          0, scale, 0, 0,

                          // row2
                          0, 0, 1, 0,

                          // row3
                          x, y, 0, 1,
                        ),
                        child: _UnconstrainedAspectRatio(
                          aspectRatio: _viewerSize!.aspectRatio,
                          child: Container(
                              decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.greenAccent, width: 4),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onDoubleTap: toggleZoom,
              child: SizeListenableContainer(
                onSizeChanged: (size) {
                  setState(() {
                    _viewerSize = size;
                  });
                },
                child: InteractiveViewer(
                  key: _viewerKey,
                  transformationController: _transformationController,
                  maxScale: 2,
                  scaleEnabled: false,
                  child: widget.child,
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            child: GestureDetector(
              onTap: toggleZoom,
              child: Opacity(
                opacity: 0.7,
                child: ClipOval(
                  child: Container(
                    height: _kMinimapMaxSize,
                    width: _kMinimapMaxSize,
                    color: Colors.grey,
                    foregroundDecoration: const ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.black38,
                          width: 1,
                        ),
                      ),
                    ),
                    child: buildMiniMap(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UnconstrainedAspectRatio extends StatelessWidget {
  const _UnconstrainedAspectRatio(
      {required this.child, required this.aspectRatio});

  final Widget child;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    // Align を挟むことで、child の RenderObjectWidget のサイズを maxWidth/maxHeight に指定する
    return Align(
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: child,
      ),
    );
  }
}
