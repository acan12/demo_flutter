import 'package:demo_flutter/bloc/counter/counter_bloc.dart';
import 'package:demo_flutter/bloc/counter/counter_event.dart';
import 'package:demo_flutter/bloc/counter/counter_state.dart';
import 'package:demo_flutter/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  final counter = CounterCubit();
  counter.stream.listen((event) {
    print("ini adalah stream state $event");
  });
  await Future.delayed(const Duration(seconds: 2));
  counter.increament();
  print("state value:" + counter.state.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
              useMaterial3: true,
            ),
            home: const HomePage(title: "Demo Bloc")));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncreamentEvent());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecreamentEvent());
                  },
                  child: const Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
