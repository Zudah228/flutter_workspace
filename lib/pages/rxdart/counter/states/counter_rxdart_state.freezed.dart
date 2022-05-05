// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'counter_rxdart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CounterRxdartState {
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterRxdartStateCopyWith<CounterRxdartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterRxdartStateCopyWith<$Res> {
  factory $CounterRxdartStateCopyWith(
          CounterRxdartState value, $Res Function(CounterRxdartState) then) =
      _$CounterRxdartStateCopyWithImpl<$Res>;
  $Res call({int count});
}

/// @nodoc
class _$CounterRxdartStateCopyWithImpl<$Res>
    implements $CounterRxdartStateCopyWith<$Res> {
  _$CounterRxdartStateCopyWithImpl(this._value, this._then);

  final CounterRxdartState _value;
  // ignore: unused_field
  final $Res Function(CounterRxdartState) _then;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CounterRxdartStateCopyWith<$Res>
    implements $CounterRxdartStateCopyWith<$Res> {
  factory _$CounterRxdartStateCopyWith(
          _CounterRxdartState value, $Res Function(_CounterRxdartState) then) =
      __$CounterRxdartStateCopyWithImpl<$Res>;
  @override
  $Res call({int count});
}

/// @nodoc
class __$CounterRxdartStateCopyWithImpl<$Res>
    extends _$CounterRxdartStateCopyWithImpl<$Res>
    implements _$CounterRxdartStateCopyWith<$Res> {
  __$CounterRxdartStateCopyWithImpl(
      _CounterRxdartState _value, $Res Function(_CounterRxdartState) _then)
      : super(_value, (v) => _then(v as _CounterRxdartState));

  @override
  _CounterRxdartState get _value => super._value as _CounterRxdartState;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_CounterRxdartState(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CounterRxdartState implements _CounterRxdartState {
  _$_CounterRxdartState({this.count = 0});

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'CounterRxdartState(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CounterRxdartState &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$CounterRxdartStateCopyWith<_CounterRxdartState> get copyWith =>
      __$CounterRxdartStateCopyWithImpl<_CounterRxdartState>(this, _$identity);
}

abstract class _CounterRxdartState implements CounterRxdartState {
  factory _CounterRxdartState({final int count}) = _$_CounterRxdartState;

  @override
  int get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CounterRxdartStateCopyWith<_CounterRxdartState> get copyWith =>
      throw _privateConstructorUsedError;
}
