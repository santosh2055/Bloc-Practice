// ignore_for_file: prefer_const_constructors

import 'package:bloc_3/Logic/Cubit/counter_cubit.dart';
import 'package:bloc_3/Logic/Cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreeen extends StatefulWidget {
  const SecondScreeen({Key? key}) : super(key: key);
  @override
  _SecondScreeenState createState() => _SecondScreeenState();
}

class _SecondScreeenState extends State<SecondScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Second Screen'),
      ),
      body: (
        Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 5),
                        content: Text('Incremented'),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 5),
                        content: Text('Decremented'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    'The Number is: ${state.counterValue}',
                    style: const TextStyle(fontSize: 22),
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: 1,
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      child: const Icon(Icons.add),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      heroTag: 2,
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
