import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverDecoratedBox extends StatelessWidget {
  const SliverDecoratedBox({
    Key? key,
    required this.decoration,
    required this.sliver,
    this.padding,
  }) : super(key: key);

  final Decoration decoration;
  final EdgeInsetsGeometry? padding;
  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return SliverStack(children: [
      SliverPositioned.fill(
          child: DecoratedBox(
        decoration: decoration,
      )),
      if (padding == null)
        sliver
      else
        SliverPadding(
          padding: padding!,
          sliver: sliver,
        )
    ]);
  }
}
