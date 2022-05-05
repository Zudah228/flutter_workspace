// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
      createdAt: const DateTimeIsoStringConverter()
          .fromJson(json['createdAt'] as String),
    );
