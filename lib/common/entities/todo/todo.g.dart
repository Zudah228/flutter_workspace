// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      colorCategory: $enumDecodeNullable(
              _$TodoColorCategoryEnumMap, json['colorCategory']) ??
          TodoColorCategory.blue,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      isArchived: json['isArchived'] as bool?,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'todoId': instance.todoId,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'colorCategory': _$TodoColorCategoryEnumMap[instance.colorCategory],
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
      'isArchived': instance.isArchived,
    };

const _$TodoColorCategoryEnumMap = {
  TodoColorCategory.red: 'red',
  TodoColorCategory.blue: 'blue',
  TodoColorCategory.green: 'green',
};
