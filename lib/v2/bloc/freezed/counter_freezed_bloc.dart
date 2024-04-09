import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_freezed_bloc.freezed.dart';

part 'counter_freezed_event.dart';

part 'counter_freezed_state.dart';

class CounterFreezedBloc
    extends Bloc<CounterFreezedEvent, CounterFreezedState> {
  CounterFreezedBloc() : super(const _Initial()) {
    on<CounterFreezedEvent>((event, emit) {
      emit(state.when(
          initial: () => CounterFreezedState.running(0),
          running: (number) {
            return event.when(
                increament: () => CounterFreezedState.running(number + 1),
                decreament: () => CounterFreezedState.running(number - 1));
          }));
    });
  }
}
