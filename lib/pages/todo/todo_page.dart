import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_workspace/pages/todo/providers/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosState = ref.watch(todosProvider);
    final todosNotifier = ref.watch(todosProvider.notifier);
    final formKey = useState(GlobalKey<FormFieldState<String>>());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: formKey.value,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          todosNotifier
                              .add(formKey.value.currentState?.value ?? '');
                          formKey.value.currentState?.didChange('');
                        },
                        child: const Icon(Icons.add))
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                      itemCount: todosState.length,
                      itemBuilder: ((context, index) {
                        final todo = todosState[index];

                        return Dismissible(
                          key: ValueKey(todo.todoId),
                          onDismissed: (_) {
                            todosNotifier.remove(todo.todoId);
                          },
                          background: const ColoredBox(
                            color: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          child: CheckboxListTile(
                            title: TextFormField(
                              initialValue: todo.title,
                              onChanged: (value) {
                                todosNotifier.edit(
                                    todoId: todo.todoId, title: value);
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                            subtitle: Text(DateFormat('yyyy年MM月dd日 HH:mm')
                                .format(todo.createdAt)),
                            value: todo.isDone,
                            onChanged: (_) {
                              todosNotifier.toggle(todo.todoId);
                            },
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
