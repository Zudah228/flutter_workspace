import 'package:flutter_workspace/common/converters/date_time_timestamp_converter.dart';
import 'package:flutter_workspace/common/entities/todo/todo_color_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(toStringOverride: false)
class Todo with _$Todo {
  const Todo._();
  factory Todo({
    required String todoId,
    required String title,
    required bool isCompleted,
    required TodoColorCategory colorCategory,
    @DateTimeTimestampConverter() required DateTime createdAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  static get sqflitePath => 'todos';
}
