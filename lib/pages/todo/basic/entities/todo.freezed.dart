// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalJsonTodo _$LocalJsonTodoFromJson(Map<String, dynamic> json) {
  return _LocalJsonTodo.fromJson(json);
}

/// @nodoc
mixin _$LocalJsonTodo {
  String get todoId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  @DateTimeIsoStringConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalJsonTodoCopyWith<LocalJsonTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalJsonTodoCopyWith<$Res> {
  factory $LocalJsonTodoCopyWith(
          LocalJsonTodo value, $Res Function(LocalJsonTodo) then) =
      _$LocalJsonTodoCopyWithImpl<$Res>;
  $Res call(
      {String todoId,
      String title,
      bool isDone,
      @DateTimeIsoStringConverter() DateTime createdAt});
}

/// @nodoc
class _$LocalJsonTodoCopyWithImpl<$Res>
    implements $LocalJsonTodoCopyWith<$Res> {
  _$LocalJsonTodoCopyWithImpl(this._value, this._then);

  final LocalJsonTodo _value;
  // ignore: unused_field
  final $Res Function(LocalJsonTodo) _then;

  @override
  $Res call({
    Object? todoId = freezed,
    Object? title = freezed,
    Object? isDone = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$LocalJsonTodoCopyWith<$Res>
    implements $LocalJsonTodoCopyWith<$Res> {
  factory _$LocalJsonTodoCopyWith(
          _LocalJsonTodo value, $Res Function(_LocalJsonTodo) then) =
      __$LocalJsonTodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String todoId,
      String title,
      bool isDone,
      @DateTimeIsoStringConverter() DateTime createdAt});
}

/// @nodoc
class __$LocalJsonTodoCopyWithImpl<$Res>
    extends _$LocalJsonTodoCopyWithImpl<$Res>
    implements _$LocalJsonTodoCopyWith<$Res> {
  __$LocalJsonTodoCopyWithImpl(
      _LocalJsonTodo _value, $Res Function(_LocalJsonTodo) _then)
      : super(_value, (v) => _then(v as _LocalJsonTodo));

  @override
  _LocalJsonTodo get _value => super._value as _LocalJsonTodo;

  @override
  $Res call({
    Object? todoId = freezed,
    Object? title = freezed,
    Object? isDone = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_LocalJsonTodo(
      todoId: todoId == freezed
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_LocalJsonTodo extends _LocalJsonTodo {
  _$_LocalJsonTodo(
      {required this.todoId,
      required this.title,
      required this.isDone,
      @DateTimeIsoStringConverter() required this.createdAt})
      : super._();

  factory _$_LocalJsonTodo.fromJson(Map<String, dynamic> json) =>
      _$$_LocalJsonTodoFromJson(json);

  @override
  final String todoId;
  @override
  final String title;
  @override
  final bool isDone;
  @override
  @DateTimeIsoStringConverter()
  final DateTime createdAt;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalJsonTodo &&
            const DeepCollectionEquality().equals(other.todoId, todoId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.isDone, isDone) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todoId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isDone),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$LocalJsonTodoCopyWith<_LocalJsonTodo> get copyWith =>
      __$LocalJsonTodoCopyWithImpl<_LocalJsonTodo>(this, _$identity);
}

abstract class _LocalJsonTodo extends LocalJsonTodo {
  factory _LocalJsonTodo(
          {required final String todoId,
          required final String title,
          required final bool isDone,
          @DateTimeIsoStringConverter() required final DateTime createdAt}) =
      _$_LocalJsonTodo;
  _LocalJsonTodo._() : super._();

  factory _LocalJsonTodo.fromJson(Map<String, dynamic> json) =
      _$_LocalJsonTodo.fromJson;

  @override
  String get todoId => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  bool get isDone => throw _privateConstructorUsedError;
  @override
  @DateTimeIsoStringConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalJsonTodoCopyWith<_LocalJsonTodo> get copyWith =>
      throw _privateConstructorUsedError;
}
