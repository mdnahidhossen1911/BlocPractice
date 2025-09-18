import 'package:bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter/counter_event.dart';
import 'package:bloc_practice/bloc/counter/counter_state.dart';
import 'package:bloc_practice/ui/widget/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(
            builder: (context, state) {
              return Text(
                state.count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          GapVertical(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: Colors.green,
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                },
                icon: Icon(Icons.add),
              ),
              GapHorizontal(30),
              IconButton(
                color: Colors.redAccent,
                onPressed: () {
                  context.read<CounterBloc>().add(Decrement());
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
