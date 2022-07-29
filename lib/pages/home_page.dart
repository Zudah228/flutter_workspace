import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/app_lifecycle/app_lifecycle_page.dart';

import '_exports.dart';
import 'abstract_only_navigation_page.dart';
import 'date_picker/date_picker.dart';
import 'firebase/check_email_verification/check_email_verification_page.dart';
import 'form_field_key_workspace/form_field_key_workspace_page.dart';
import 'type_guard/type_guard_page.dart';

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
      const NavigationPage(title: '2022/6/28 `is` による TypeGuard の挙動チェック', page: TypeGuardPage()),
      const NavigationPage(title: '2022/7/4 Firebase Auth の email verification を監視する', page: CheckEmailVerificationPage()),
      const NavigationPage(title: '2022/7/11 いろんな DatePicker', page: DatePickerWorkspacePage()),
      const NavigationPage(title: '2022/7/29 フォアグラウンド／バックグラウンドの挙動', page: AppLifecyclePage())
    ]);

}
