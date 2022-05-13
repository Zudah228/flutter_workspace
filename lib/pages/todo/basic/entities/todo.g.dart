// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalJsonTodo _$$_LocalJsonTodoFromJson(Map<String, dynamic> json) =>
    _$_LocalJsonTodo(
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
      createdAt: const DateTimeIsoStringConverter()
          .fromJson(json['createdAt'] as String),
    );
