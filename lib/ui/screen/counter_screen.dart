import 'package:bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter/counter_event.dart';
import 'package:bloc_practice/bloc/counter/counter_state.dart';
import 'package:bloc_practice/bloc/swithing/switing_bloc.dart';
import 'package:bloc_practice/bloc/swithing/switing_event.dart';
import 'package:bloc_practice/bloc/swithing/switing_state.dart';
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
          BlocBuilder<SwitingBloc, SwitingState>(
            buildWhen: (previous, current) => previous.switching != current.switching, // Only rebuild when 'switching' changes
            builder: (context, state) {
              print('Switch rebuild');
              return Switch(
                value: state.switching,
                onChanged: (value) {
                  context.read<SwitingBloc>().add(SwitchOnOrOff());
                },
              );
            },
          ),
          BlocBuilder<CounterBloc, CounterState>(
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
          GapVertical(30),
          BlocBuilder<SwitingBloc, SwitingState>(
            buildWhen: (previous, current) => previous.sliderValue != current.sliderValue, // Only rebuild when 'sliderValue' changes
            builder: (context, state) {
              print('Slider rebuild');
              return Slider(value: state.sliderValue, onChanged: (value) {
                context.read<SwitingBloc>().add(SliderChanged(value));
              });
            },
          ),
        ],
      ),
    );
  }
}
