import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/home_page.dart';

@immutable
class AbstractOnlyNavigationPage extends StatelessWidget {
  const AbstractOnlyNavigationPage({required this.pages}) : super(key: null);
  final List<NavigationPage> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pages.map((e) => _NavigateButton(btnText: e.title, page: e.page)).toList(),
        ),
      ),
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