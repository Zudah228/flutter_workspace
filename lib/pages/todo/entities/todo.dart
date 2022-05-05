import 'package:flutter_workspace/common/converters/date_time_iso_string_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@Freezed(toJson: false, toStringOverride: false)
class Todo with _$Todo {
  const Todo._();
  factory Todo({
    required String todoId,
    required String title,
    required bool isDone,
    @DateTimeIsoStringConverter() required DateTime createdAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) =>
			_$TodoFromJson(json);
}
