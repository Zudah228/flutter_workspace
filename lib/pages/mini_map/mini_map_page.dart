import 'package:flutter/material.dart';

class MiniMapPage extends StatefulWidget {
  const MiniMapPage({super.key});

  @override
  State<MiniMapPage> createState() => _MiniMapPageState();
}

class _MiniMapPageState extends State<MiniMapPage> {
  final _transformationController = TransformationController();
  final _interactiveViewerKey = GlobalKey<State<InteractiveViewer>>();
  final _imageKey = GlobalKey();
  final _miniMapKey = GlobalKey();

  Size? _size;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _size = _imageKey.currentContext?.size;
        });

        _transformationController.addListener(() {
          print(_transformationController.value.getRow(0).storage);
          print(_transformationController.value.getRow(1).storage);
          print(_transformationController.value.getRow(2).storage);
          print(_transformationController.value.getRow(3).storage);
          print('');
          _miniMapKey.currentState?.setState(() {});
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runtimeType.toString()),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                _transformationController.value = Matrix4.identity();
              },
              icon: const Icon(
                Icons.refresh,
                size: 32,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: InteractiveViewer(
                      key: _interactiveViewerKey,
                      transformationController: _transformationController,
                      maxScale: 4,
                      child: Image.asset(
                        "assets/images/gridman_universe.jpeg",
                        key: _imageKey,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  if (_size != null && _size!.aspectRatio != 0)
                    Positioned(
                      left: 12,
                      top: 12,
                      child: _MiniMap(
                        key: _miniMapKey,
                        size: _size!,
                        transformationController: _transformationController,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniMap extends StatefulWidget {
  const _MiniMap({
    super.key,
    required this.size,
    required this.transformationController,
  });

  final Size size;
  final TransformationController transformationController;

  @override
  State<_MiniMap> createState() => _MiniMapState();
}

class _MiniMapState extends State<_MiniMap> {
  final _containerKey = GlobalKey();
  Size? _containerSize;

  Size get _viewerSize => widget.size;
  Matrix4 get _viewerMatrix => widget.transformationController.value;
  double get _viewerScale => _viewerMatrix.storage[0];
  double get _viewerX => (_viewerMatrix.getRow(0)[3] / _viewerScale) * -1;
  double get _viewerY => (_viewerMatrix.getRow(1)[3] / _viewerScale) * -1;

  double get _scale => 1 / _viewerScale;
  double get _x => _viewerX / (_viewerSize.width / _containerSize!.width);

  double get _y => _viewerY / (_viewerSize.height / _containerSize!.height);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _containerSize = _containerKey.currentContext?.size;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: SizedBox(
        height: 120,
        width: 120,
        child: ClipOval(
          child: ColoredBox(
            color: Colors.grey,
            child: Container(
              key: _containerKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _UnconstrainedAspectRatio(
                  aspectRatio: widget.size.aspectRatio,
                  child: Stack(
                    children: [
                      const Positioned.fill(
                        child: ColoredBox(color: Colors.white70),
                      ),
                      if (_containerSize != null)
                        Positioned.fill(
                          child: Transform(
                            transform: Matrix4(
                              // row0
                              _scale, 0, 0, 0,

                              // row1
                              0, _scale, 0, 0,

                              // row2
                              0, 0, 1, 0,

                              // row3
                              _x * _scale, _y * _scale, 0, 1,
                            ),
                            // origin: Offset(_x, _y),
                            child: _UnconstrainedAspectRatio(
                              aspectRatio: widget.size.aspectRatio,
                              child: const ColoredBox(color: Colors.indigo),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
