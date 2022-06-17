import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/abstract_only_navigation_page.dart';
import 'package:flutter_workspace/pages/_exports.dart';
import 'package:flutter_workspace/pages/form_field_key_workspace/form_field_key_workspace_page.dart';

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
      const NavigationPage(page: FormFieldKeyWorkspacePage(), title: '2022/6/17 FormFieldState Key ページ'),
    ]);

}
