import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/extensions/date_extension.dart';
import 'package:flutter_workspace/pages/home_page.dart';

@immutable
abstract class AbstractOnlyNavigationPage extends StatelessWidget {
  const AbstractOnlyNavigationPage({required this.pages}) : super(key: null);
  final List<NavigationPage> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              children: [
                for (final page in pages) ...[
                  _NavigateButton(
                      btnText:
                          '${page.year == null ? '' : DateTime(page.year!, page.month!, page.day!).format(
                              pattern: 'yy/M/d:',
                            )} ${page.title ?? page.page.runtimeType}',
                      page: page.page),
                  const SizedBox(
                    height: 8,
                  )
                ]
              ],
            ),
          ),
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(btnText),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
