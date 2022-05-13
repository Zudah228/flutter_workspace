import 'package:flutter_workspace/common/converters/date_time_iso_string_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(toJson: false, toStringOverride: false)
class LocalJsonTodo with _$LocalJsonTodo {
  const LocalJsonTodo._();
  factory LocalJsonTodo({
    required String todoId,
    required String title,
    required bool isDone,
    @DateTimeIsoStringConverter() required DateTime createdAt,
  }) = _LocalJsonTodo;

  factory LocalJsonTodo.fromJson(Map<String, dynamic> json) =>
			_$LocalJsonTodoFromJson(json);
}
