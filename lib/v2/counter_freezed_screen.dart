import 'package:demo_flutter/v2/bloc/freezed/counter_freezed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterFreezedScreen extends StatelessWidget {
  const CounterFreezedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Counter Freezed"),
      ),
      body: Center(
        child: BlocBuilder<CounterFreezedBloc, CounterFreezedState>(
          builder: (context, state) {
            return Text(
              state
                  .when(initial: () => '-', running: (number) => '$number')
                  .toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context
                  .read<CounterFreezedBloc>()
                  .add(const CounterFreezedEvent.decreament());
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context
                  .read<CounterFreezedBloc>()
                  .add(const CounterFreezedEvent.increament());
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
