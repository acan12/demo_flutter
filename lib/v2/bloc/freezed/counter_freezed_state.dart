part of 'counter_freezed_bloc.dart';

@freezed
class CounterFreezedState with _$CounterFreezedState {
  const factory CounterFreezedState.initial(int defValue) = _Initial;
  const factory CounterFreezedState.running(int number) = _Running;

}
