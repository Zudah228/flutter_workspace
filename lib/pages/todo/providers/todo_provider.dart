import 'package:flutter_workspace/common/bundle_repository.dart';
import 'package:flutter_workspace/common/entities/todo/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final todosProvider = StateNotifierProvider<TodoPageNotifier, List<Todo>>(
    ((ref) => TodoPageNotifier(ref.read, [])));

class TodoPageNotifier extends StateNotifier<List<Todo>> {
  TodoPageNotifier(this.read, List<Todo>? initialTodos)
      : super(initialTodos ?? []);
  final Reader read;
  late final bundleRepository = read(bundleRepositoryProvider);

  Future<void> fetch() async {
    try {
      final json = await bundleRepository.fetch('assets/json/todo.json');
      if (json != null) {
        final todo = Todo.fromJson(json);
        state = [
          ...state,
          todo
        ];
      }
    } catch (e) {
      print(e);
    }
  }

  void add(String title) {
    state = [
      ...state,
      Todo(
        todoId: _uuid.v4(),
        title: title,
        isDone: false,
        createdAt: DateTime.now(),
      )
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.todoId == id) todo.copyWith(isDone: !todo.isDone) else todo,
    ];
  }

  void edit({required String todoId, required String title}) {
    state = [
      for (final todo in state)
        if (todo.todoId == todoId)
          todo.copyWith(
            title: title,
          )
        else
          todo,
    ];
  }

  void remove(String todoId) {
    state = state.where((todo) => todo.todoId != todoId).toList();
  }
}
