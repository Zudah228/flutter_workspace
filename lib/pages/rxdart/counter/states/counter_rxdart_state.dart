import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_rxdart_state.freezed.dart';

@freezed
class CounterRxdartState with _$CounterRxdartState {
  const CounterRxdartState._();
  factory CounterRxdartState({
    @Default(0) int count,
  }) = _CounterRxdartState;
}
