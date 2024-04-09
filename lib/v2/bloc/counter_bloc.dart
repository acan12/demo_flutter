import 'package:demo_flutter/v2/bloc/counter_event.dart';
import 'package:demo_flutter/v2/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) { 
    on<IncreamentEvent>((event, emit) {
      emit(CounterState(state.counterValue + 1));
    });

    on<DecreamentEvent>((event, emit){
      emit(CounterState(state.counterValue -1));
    });
  }
}
