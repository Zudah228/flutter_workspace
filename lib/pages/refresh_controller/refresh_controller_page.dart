import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RefreshControllerPage extends ConsumerStatefulWidget {
  const RefreshControllerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RefreshControllerPageState();
}

class _RefreshControllerPageState extends ConsumerState<RefreshControllerPage> {
  List<String> list = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
  ];
  Future<void> wait() => Future.delayed(const Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollViewWithRefresh(
        onRefresh: () async {
          await wait();
          setState(() {
            list.length = 5;
          });
        },
        onLoading: () async {
          await wait();
          setState(() {
            list = [...list, ...list];
          });
        },
        headerSlivers: [
          SliverAppBar(
            title: Text(widget.runtimeType.toString()),
            pinned: true,
          ),
        ],
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                title: Text(list[index]),
              );
            }, childCount: list.length),
          )
        ],
      ),
    );
  }
}

class CustomScrollViewWithRefresh extends StatefulWidget {
  const CustomScrollViewWithRefresh(
      {super.key,
      this.headerSlivers,
      this.footerSlivers,
      required this.slivers,
      required this.onLoading,
      required this.onRefresh});

  final List<Widget> slivers;
  final List<Widget>? headerSlivers;
  final List<Widget>? footerSlivers;

  final Future<void> Function() onLoading;
  final Future<void> Function() onRefresh;

  @override
  State<CustomScrollViewWithRefresh> createState() =>
      _CustomScrollViewWithRefreshState();
}

class _CustomScrollViewWithRefreshState
    extends State<CustomScrollViewWithRefresh> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (isLoading) return true;
          final scrollProportion = notification.metrics.pixels -
              notification.metrics.maxScrollExtent;

          if (scrollProportion > 80) {
            Future(() async {
              setState(() {
                isLoading = true;
              });
              await widget.onLoading();
              setState(() {
                isLoading = false;
              });
            });
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            if (widget.headerSlivers != null) ...widget.headerSlivers!,
            CupertinoSliverRefreshControl(
              onRefresh: widget.onRefresh,
              refreshTriggerPullDistance: 500,
              builder: (context, _, __, ___, ____) =>
                  const CircularProgressIndicator.adaptive(),
            ),
            ...widget.slivers,
            if (isLoading)
              const SliverToBoxAdapter(
                child: CircularProgressIndicator.adaptive(),
              ),
            if (widget.footerSlivers != null) ...widget.footerSlivers!,
          ],
        ));
  }
}
