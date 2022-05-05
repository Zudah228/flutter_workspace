import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/_exports.dart';
import 'package:flutter_workspace/pages/rxdart/rxdart_page.dart';

@immutable
class Page {
  const Page({required this.title, required this.page});
  final String title;
  final Widget page;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _pageList = <Page>[
      const Page(page: OverlayDialogPage(), title: '2022/1/3 自動で閉じるダイアログ'),
      const Page(page: TodoPage(), title: '2022/4/20 Todoページ'),
      const Page(page: RxdartPage(), title: '2022/4/27 Rxdartページ'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Workspace'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _pageList
                  .map((e) => _NavigateButton(btnText: e.title, page: e.page))
                  .toList())),
    );
  }
}

class _NavigateButton extends StatelessWidget {
  const _NavigateButton({
    Key? key,
    required this.btnText,
    required this.page,
  }) : super(key: key);

  final String btnText;
  final Widget page;

  @override
  Widget build(BuildContext context) {
      return ElevatedButton(
        child: Text(btnText),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => page),
          );
        },
      );
  }
}
