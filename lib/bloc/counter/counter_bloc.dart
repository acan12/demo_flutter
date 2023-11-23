import 'package:bloc/bloc.dart';
import 'package:demo_flutter/bloc/counter/counter_event.dart';
import 'package:demo_flutter/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterIncreamentEvent>((event, emit) => {
      emit(CounterIncrementState(state.counter+1))
    });

    on<CounterDecreamentEvent>((event, emit){
      emit(CounterDecrementState(state.counter-1));
    });
  }
}
