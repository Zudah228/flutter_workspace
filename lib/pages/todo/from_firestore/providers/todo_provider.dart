import 'package:flutter_workspace/common/entities/todo/todo.dart';
import 'package:flutter_workspace/common/entities/todo/todo_color_category.dart';
import 'package:flutter_workspace/common/repositories/firestore/document_repository.dart';
import 'package:flutter_workspace/common/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final todosFromFirestoreProvider = StateNotifierProvider.autoDispose<
    TodoFromFirestorePageNotifier,
    List<Todo>>(((ref) => TodoFromFirestorePageNotifier(ref.read, [])));

class TodoFromFirestorePageNotifier extends StateNotifier<List<Todo>> {
  TodoFromFirestorePageNotifier(Reader read, List<Todo>? initialTodos)
      : _read = read,
        super(initialTodos ?? []);
  final Reader _read;
  String _documentPath(String id) => 'todos/$id';

  late final _collectionRepository =
      _read(todoCollectionPagingRepositoryProvider);
  late final _documentRepository = _read(firestoreDocumentRepositoryProvider);

  Future<void> fetch() async {
    try {
      final list = await _collectionRepository.fetch();
      state = list.map((e) => e.entity!).toList();
    } catch (e) {
      Logger().log(e.toString());
    }
  }

  Future<void> add(String title) async {
    final todoId = _uuid.v4();
    final todo = Todo(
      colorCategory: TodoColorCategory.red,
      todoId: todoId,
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    await _documentRepository.save(_documentPath(todoId), data: todo.toJson());
    state = [
      ...state,
      todo,
    ];
  }

  Future<void> toggle(String todoId, bool value) async {
    try {
      await _documentRepository
          .save(_documentPath(todoId), data: {"isCompleted": DateTime.now()});
    } catch (e) {
      Logger().log(e.toString());
    }
    state = [
      for (final todo in state)
        if (todo.todoId == todoId) todo.copyWith(isCompleted: value) else todo,
    ];
  }

  Future<void> edit({required String todoId, required String title}) async {
    await _documentRepository
        .save(_documentPath(todoId), data: {"title": title});
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

  Future<void> remove(String todoId) async {
    await _documentRepository.delete(_documentPath(todoId));
    state = state.where((todo) => todo.todoId != todoId).toList();
  }

  void sort() {
    state.sort((a, b) {
      if (a.isCompleted == b.isCompleted) {
        return a.createdAt.compareTo(b.createdAt);
      }
      if (!a.isCompleted && b.isCompleted) {
        return -1;
      }
      // if (a.isCompleted && !b.isCompleted) {
      return 1;
      // }
    });
  }
}
