import 'package:demo_flutter/v2/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Counter App"),),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(state.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: () {
            context.read<CounterCubit>().increment();
          },
            child: const Icon(Icons.add),),
          FloatingActionButton(onPressed: () {
            context.read<CounterCubit>().decrement();
          },
            child: const Icon(Icons.remove),)
        ],
      ),
    );
  }

}