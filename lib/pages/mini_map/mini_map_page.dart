import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mini_map_interactive_view.dart';

final _imagePathsIndex = StateProvider<int>((_) => 0);
const _imagePaths = [
  "assets/images/gridman_universe.jpeg",
  "assets/images/25275_SwordArt_Online_PC.jpg"
];

class MiniMapPage extends StatefulWidget {
  const MiniMapPage({super.key});

  @override
  State<MiniMapPage> createState() => _MiniMapPageState();
}

class _MiniMapPageState extends State<MiniMapPage> {
  final _miniMapKey = GlobalKey<MiniMapInteractiveViewState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runtimeType.toString()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              _miniMapKey.currentState!.reset();
            },
            icon: const Icon(
              Icons.refresh,
              size: 32,
            ),
          ),
          Consumer(builder: (context, ref, _) {
            return IconButton(
              onPressed: () {
                ref.read(_imagePathsIndex.notifier).update(
                    (state) => state == _imagePaths.length - 1 ? 0 : state + 1);
              },
              icon: const Icon(
                Icons.toggle_off,
                size: 32,
              ),
            );
          }),
          Expanded(
            child: MiniMapInteractiveView(
              key: _miniMapKey,
              child: const _Image(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatefulWidget {
  const _Image();

  @override
  State<_Image> createState() => _ImageState();
}

class _ImageState extends State<_Image> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.amber,
      child: Consumer(
        builder: (context, ref, _) {
          final index = ref.watch(_imagePathsIndex);
          return Image.asset(
            _imagePaths[index],
            fit: BoxFit.fitWidth,
          );
        },
      ),
    );
  }
}
