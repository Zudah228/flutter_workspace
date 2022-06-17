import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/todo/mvvm_todo/mvvm_todo_page_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MvvmTodoPage extends ConsumerWidget {
  const MvvmTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(mvvmPageProvider);
    final pageNotifier = ref.read(mvvmPageProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: pageState.textController,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                ElevatedButton(onPressed: pageNotifier.addTodo, child: const Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pageState.todos.length,
              itemBuilder: (context, index) {
                final todo = pageState.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.createdAt.toIso8601String()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
