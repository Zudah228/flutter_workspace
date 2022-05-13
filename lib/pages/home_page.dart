import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/abstract_only_navigation_page.dart';
import 'package:flutter_workspace/pages/_exports.dart';

@immutable
class NavigationPage {
  const NavigationPage({required this.title, required this.page});
  final String title;
  final Widget page;
}

class MyHomePage extends AbstractOnlyNavigationPage {
  MyHomePage() : super(pages: [
      const NavigationPage(page: OverlayDialogPage(), title: '2022/1/3 自動で閉じるダイアログ'),
      NavigationPage(page: TodoPage(), title: '2022/4/20 Todoページ'),
      const NavigationPage(page: RxdartPage(), title: '2022/4/27 Rxdartページ'),
    ]);

}
