import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/extensions/build_context_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VisibilityPage extends ConsumerStatefulWidget {
  const VisibilityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VisibilityPageState();
}

class _VisibilityPageState extends ConsumerState<VisibilityPage> {
  var visible = true;
  @override
  Widget build(BuildContext context) {
    final visibleTile = GestureDetector(
        onTap: () {
          print('tapped!');
          context.showSnackBar('tapped!');
        },
        child: const _Tile(color: Colors.green));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.runtimeType.toString(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: const Text('toggle')),
            const SizedBox(
              height: 32,
            ),
            const Text('表示領域調査'),
            const SizedBox(
              height: 16,
            ),
            Row(
                children: [
              _ColumnTiles(
                  child: Visibility(
                visible: visible,
                child: visibleTile,
              )),
              _ColumnTiles(
                  child: Opacity(
                opacity: visible ? 1.0 : 0.0,
                child: visibleTile,
              )),
              _ColumnTiles(
                  child: IgnorePointer(
                ignoring: !visible,
                child: Opacity(
                  opacity: visible ? 1.0 : 0.0,
                  child: visibleTile,
                ),
              )),
            ]
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: e,
                        ))
                    .toList()),
            const SizedBox(
              height: 64,
            ),
            const Text('Alignment 調査'),
            const SizedBox(
              height: 16,
            ),
            _RowTiles(
              child: Visibility(
                visible: visible,
                child: visibleTile,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _RowTiles(
              child: visible ? visibleTile : null,
              title: 'Collection if',
            ),
            const SizedBox(
              height: 64,
            ),
          ],
        )),
      ),
    );
  }
}

const _size = 100.0;

class _ColumnTiles extends StatelessWidget {
  const _ColumnTiles({super.key, required this.child, this.title});
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    const tile = SizedBox(
        height: _size, width: _size, child: ColoredBox(color: Colors.red));
    return Column(
      children: [
        tile,
        child,
        tile,
        Text(title ?? child.runtimeType.toString())
      ],
    );
  }
}

class _RowTiles extends StatelessWidget {
  const _RowTiles({super.key, required this.child, this.title});
  final Widget? child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: _size,
          width: 800,
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (child != null) child!,
              const _Tile(color: Colors.purple),
            ],
          ),
        ),
        Text(title ?? child.runtimeType.toString())
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size,
      width: _size,
      child: ColoredBox(color: color),
    );
  }
}
