// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mvvm_todo_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MvvmTodoPageState {
  TextEditingController get textController =>
      throw _privateConstructorUsedError;
  ImagePicker get imgPicker => throw _privateConstructorUsedError;
  File? get imgFile => throw _privateConstructorUsedError;
  List<Todo> get todos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MvvmTodoPageStateCopyWith<MvvmTodoPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MvvmTodoPageStateCopyWith<$Res> {
  factory $MvvmTodoPageStateCopyWith(
          MvvmTodoPageState value, $Res Function(MvvmTodoPageState) then) =
      _$MvvmTodoPageStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController textController,
      ImagePicker imgPicker,
      File? imgFile,
      List<Todo> todos});
}

/// @nodoc
class _$MvvmTodoPageStateCopyWithImpl<$Res>
    implements $MvvmTodoPageStateCopyWith<$Res> {
  _$MvvmTodoPageStateCopyWithImpl(this._value, this._then);

  final MvvmTodoPageState _value;
  // ignore: unused_field
  final $Res Function(MvvmTodoPageState) _then;

  @override
  $Res call({
    Object? textController = freezed,
    Object? imgPicker = freezed,
    Object? imgFile = freezed,
    Object? todos = freezed,
  }) {
    return _then(_value.copyWith(
      textController: textController == freezed
          ? _value.textController
          : textController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      imgPicker: imgPicker == freezed
          ? _value.imgPicker
          : imgPicker // ignore: cast_nullable_to_non_nullable
              as ImagePicker,
      imgFile: imgFile == freezed
          ? _value.imgFile
          : imgFile // ignore: cast_nullable_to_non_nullable
              as File?,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
abstract class _$MvvmTodoPageStateCopyWith<$Res>
    implements $MvvmTodoPageStateCopyWith<$Res> {
  factory _$MvvmTodoPageStateCopyWith(
          _MvvmTodoPageState value, $Res Function(_MvvmTodoPageState) then) =
      __$MvvmTodoPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController textController,
      ImagePicker imgPicker,
      File? imgFile,
      List<Todo> todos});
}

/// @nodoc
class __$MvvmTodoPageStateCopyWithImpl<$Res>
    extends _$MvvmTodoPageStateCopyWithImpl<$Res>
    implements _$MvvmTodoPageStateCopyWith<$Res> {
  __$MvvmTodoPageStateCopyWithImpl(
      _MvvmTodoPageState _value, $Res Function(_MvvmTodoPageState) _then)
      : super(_value, (v) => _then(v as _MvvmTodoPageState));

  @override
  _MvvmTodoPageState get _value => super._value as _MvvmTodoPageState;

  @override
  $Res call({
    Object? textController = freezed,
    Object? imgPicker = freezed,
    Object? imgFile = freezed,
    Object? todos = freezed,
  }) {
    return _then(_MvvmTodoPageState(
      textController: textController == freezed
          ? _value.textController
          : textController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      imgPicker: imgPicker == freezed
          ? _value.imgPicker
          : imgPicker // ignore: cast_nullable_to_non_nullable
              as ImagePicker,
      imgFile: imgFile == freezed
          ? _value.imgFile
          : imgFile // ignore: cast_nullable_to_non_nullable
              as File?,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_MvvmTodoPageState implements _MvvmTodoPageState {
  _$_MvvmTodoPageState(
      {required this.textController,
      required this.imgPicker,
      this.imgFile,
      final List<Todo> todos = const []})
      : _todos = todos;

  @override
  final TextEditingController textController;
  @override
  final ImagePicker imgPicker;
  @override
  final File? imgFile;
  final List<Todo> _todos;
  @override
  @JsonKey()
  List<Todo> get todos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'MvvmTodoPageState(textController: $textController, imgPicker: $imgPicker, imgFile: $imgFile, todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MvvmTodoPageState &&
            const DeepCollectionEquality()
                .equals(other.textController, textController) &&
            const DeepCollectionEquality().equals(other.imgPicker, imgPicker) &&
            const DeepCollectionEquality().equals(other.imgFile, imgFile) &&
            const DeepCollectionEquality().equals(other.todos, todos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(textController),
      const DeepCollectionEquality().hash(imgPicker),
      const DeepCollectionEquality().hash(imgFile),
      const DeepCollectionEquality().hash(todos));

  @JsonKey(ignore: true)
  @override
  _$MvvmTodoPageStateCopyWith<_MvvmTodoPageState> get copyWith =>
      __$MvvmTodoPageStateCopyWithImpl<_MvvmTodoPageState>(this, _$identity);
}

abstract class _MvvmTodoPageState implements MvvmTodoPageState {
  factory _MvvmTodoPageState(
      {required final TextEditingController textController,
      required final ImagePicker imgPicker,
      final File? imgFile,
      final List<Todo> todos}) = _$_MvvmTodoPageState;

  @override
  TextEditingController get textController =>
      throw _privateConstructorUsedError;
  @override
  ImagePicker get imgPicker => throw _privateConstructorUsedError;
  @override
  File? get imgFile => throw _privateConstructorUsedError;
  @override
  List<Todo> get todos => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MvvmTodoPageStateCopyWith<_MvvmTodoPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
