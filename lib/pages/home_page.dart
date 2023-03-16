import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/app_lifecycle/app_lifecycle_page.dart';
import 'package:flutter_workspace/pages/best_loading_dialog.dart/best_loading_dialog_page.dart';
import 'package:flutter_workspace/pages/firebase/firebase_page.dart';
import 'package:flutter_workspace/pages/mini_map/mini_map_page.dart';
import 'package:flutter_workspace/pages/scaffold_messenger_key/scaffold_messenger_key.dart';
import 'package:flutter_workspace/pages/sliver_tools/sliver_tools_page.dart';
import 'package:flutter_workspace/pages/visibility/visibility_page.dart';

import '_exports.dart';
import 'abstract_only_navigation_page.dart';
import 'date_picker/date_picker.dart';
import 'form_field_key_workspace/form_field_key_workspace_page.dart';
import 'refresh_controller/refresh_controller_page.dart';
import 'type_guard/type_guard_page.dart';

@immutable
class NavigationPage {
  const NavigationPage({
    required this.page,
    this.title,
    this.year,
    this.month,
    this.day,
  });
  final String? title;
  final Widget page;
  final int? year;
  final int? month;
  final int? day;
}

class MyHomePage extends AbstractOnlyNavigationPage {
  MyHomePage()
      : super(pages: [
          const NavigationPage(
              page: OverlayDialogPage(),
              title: '自動で閉じるダイアログ',
              year: 2022,
              month: 1,
              day: 3),
          NavigationPage(
              page: TodoPage(),
              title: 'Todoページ',
              year: 2022,
              month: 4,
              day: 20),
          const NavigationPage(
              page: RxdartPage(),
              title: 'Rxdartページ',
              year: 2022,
              month: 1,
              day: 3),
          const NavigationPage(
              page: FormFieldKeyWorkspacePage(),
              title: 'FormFieldState Key ページ',
              year: 2022,
              month: 1,
              day: 3),
          const NavigationPage(
              title: '`is` による TypeGuard の挙動チェック',
              page: TypeGuardPage(),
              year: 2022,
              month: 1,
              day: 3),
          NavigationPage(page: FirebasePage(), year: 2022, month: 1, day: 3),
          const NavigationPage(
              title: 'いろんな DatePicker',
              page: DatePickerWorkspacePage(),
              year: 2022,
              month: 1,
              day: 3),
          const NavigationPage(
              title: 'フォアグラウンド／バックグラウンドの挙動',
              page: AppLifecyclePage(),
              year: 2022,
              month: 1,
              day: 3),
          const NavigationPage(
              title: 'Global の ScaffoldMessenger key ',
              page: ScaffoldMessengerKeyPage(),
              year: 2022,
              month: 6,
              day: 29),
          const NavigationPage(
              page: SliverToolsPage(), year: 2022, month: 10, day: 3),
          const NavigationPage(
              page: BestLoadingDialog(), year: 2022, month: 10, day: 10),
          const NavigationPage(
              page: VisibilityPage(), year: 2022, month: 10, day: 14),
          const NavigationPage(
              page: RefreshControllerPage(), year: 2022, month: 10, day: 25),
          const NavigationPage(
              page: MiniMapPage(), year: 2023, month: 3, day: 13),
        ]);
}
