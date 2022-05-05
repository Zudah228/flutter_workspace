import 'package:flutter_workspace/common/converters/date_time_timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const Counter._();
  factory Counter({
    @Default(0) int count,
  }) = _Counter;

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  static String get documentPath => 'counter/doc';
  static Map<String, dynamic> updateCountMap(int count) {
    return <String, dynamic>{
      'count': FieldValue.increment(count),
    };
  }
}
