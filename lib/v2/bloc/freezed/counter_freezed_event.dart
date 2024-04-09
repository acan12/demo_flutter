part of 'counter_freezed_bloc.dart';

@freezed
class CounterFreezedEvent with _$CounterFreezedEvent {
  const factory CounterFreezedEvent.increament() = _Increament;
  const factory CounterFreezedEvent.decreament() = _Decreament;
}
