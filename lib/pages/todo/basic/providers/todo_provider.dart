import 'package:flutter_workspace/common/repositories/bundle_repository.dart';
import 'package:flutter_workspace/common/utils/logger.dart';
import 'package:flutter_workspace/pages/todo/basic/entities/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final todosProvider =
    StateNotifierProvider.autoDispose<TodoPageNotifier, List<LocalJsonTodo>>(
        ((ref) => TodoPageNotifier(ref.read, [])));

class TodoPageNotifier extends StateNotifier<List<LocalJsonTodo>> {
  TodoPageNotifier(this.read, List<LocalJsonTodo>? initialTodos)
      : super(initialTodos ?? []);
  final Reader read;
  late final bundleRepository = read(bundleRepositoryProvider);

  Future<void> fetch() async {
    try {
      final json = await bundleRepository.fetch('assets/json/todo.json');
  
      if (json != null) {
        final todo = LocalJsonTodo.fromJson(json);
        state = [...state, todo];
      }
    } catch (e) {
      Logger().log(e.toString());
    }
  }

  void add(String title) {
    state = [
      ...state,
      LocalJsonTodo(
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
