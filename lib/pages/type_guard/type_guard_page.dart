import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/entities/todo/todo.dart';
import 'package:flutter_workspace/common/entities/todo/todo_color_category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TypeGuardPage extends HookConsumerWidget {
  const TypeGuardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = Todo(
        todoId: 'todoId',
        title: 'title',
        isCompleted: false,
        colorCategory: TodoColorCategory.blue,
        createdAt: DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: const Text('TypeGuard'),
      ),
      body: Column(
        children: [Text('freezed: ${todo is Todo}')],
      ),
    );
  }
}
