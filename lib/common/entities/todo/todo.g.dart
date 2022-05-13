// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      colorCategory:
          $enumDecode(_$TodoColorCategoryEnumMap, json['colorCategory']),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'todoId': instance.todoId,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'colorCategory': _$TodoColorCategoryEnumMap[instance.colorCategory],
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$TodoColorCategoryEnumMap = {
  TodoColorCategory.red: 'red',
  TodoColorCategory.blue: 'blue',
  TodoColorCategory.green: 'green',
};
