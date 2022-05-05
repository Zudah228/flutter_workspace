// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'todoId': instance.todoId,
      'title': instance.title,
      'isDone': instance.isDone,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
    };
