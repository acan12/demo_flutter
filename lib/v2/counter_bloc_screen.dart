import 'package:demo_flutter/v2/bloc/counter_bloc.dart';
import 'package:demo_flutter/v2/bloc/counter_event.dart';
import 'package:demo_flutter/v2/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Counter Bloc"),),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(state.counterValue.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: () {
            context.read<CounterBloc>().add(IncreamentEvent());
          },
            child: const Icon(Icons.add),),
          FloatingActionButton(onPressed: () {
            context.read<CounterBloc>().add(DecreamentEvent());
          },
            child: const Icon(Icons.remove),)
        ],
      ),
    );
  }

}