import 'package:flutter_workspace/common/converters/date_time_timestamp_converter.dart';
import 'package:flutter_workspace/common/entities/todo/todo_color_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repositories/firestore/collection_paging_repository.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(toStringOverride: false)
class Todo with _$Todo {
  const Todo._();
  factory Todo({
    required String todoId,
    required String title,
    required bool isCompleted,
    @Default(TodoColorCategory.blue) TodoColorCategory colorCategory,
    @DateTimeTimestampConverter() required DateTime createdAt,
    bool? isArchived,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  static get sqflitePath => 'todos';
  static const firestoreCollectionPath = 'todos';
}

final todoCollectionPagingRepositoryProvider =
    Provider.autoDispose<CollectionPagingRepository<Todo>>((ref) {
  return CollectionPagingRepository<Todo>(
      query:
          FirebaseFirestore.instance.collection(Todo.firestoreCollectionPath),
      limit: 10,
      decode: Todo.fromJson);
});

final todoCollectionComplexQueryPagingRepositoryProvider =
    Provider.autoDispose<CollectionPagingRepository<Todo>>((ref) {
  return CollectionPagingRepository<Todo>(
      query: FirebaseFirestore.instance
          .collection(Todo.firestoreCollectionPath)
          .where('count', isLessThan: 100),
      limit: 10,
      decode: Todo.fromJson);
});

final todoCollectionErrorComplexQueryPagingRepositoryProvider =
    Provider.autoDispose<CollectionPagingRepository<Todo>>((ref) {
  return CollectionPagingRepository<Todo>(
      query: FirebaseFirestore.instance
          .collection(Todo.firestoreCollectionPath)
          .where('tags', arrayContains: 'study')
          .where('isCompleted', isNotEqualTo: false)
          .orderBy('createdAt'),
      limit: 10,
      decode: Todo.fromJson);
});
