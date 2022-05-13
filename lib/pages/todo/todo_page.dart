import 'package:flutter_workspace/pages/abstract_only_navigation_page.dart';
import 'package:flutter_workspace/pages/home_page.dart';
import 'package:flutter_workspace/pages/todo/from_firestore/todo_from_firestore_page.dart';

import 'basic/todo_page.dart';

class TodoPage extends AbstractOnlyNavigationPage {
  TodoPage()
      : super(pages: <NavigationPage>[
          const NavigationPage(title: 'べーシック', page: BasicTodoPage()),
          const NavigationPage(
              title: 'from Firestore', page: TodoFromFirestorePage()),
        ]);
}
