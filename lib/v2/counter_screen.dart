import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App"),),
      body: const Center(
        child: Text('0', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: () {},
            child: const Icon(Icons.add),),
          FloatingActionButton(onPressed: () {},
            child: const Icon(Icons.remove),)
        ],
      ),
    );
  }

}