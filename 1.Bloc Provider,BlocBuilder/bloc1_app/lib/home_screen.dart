import 'package:bloc1_app/Cubit/counter_cubit.dart';
import 'package:bloc1_app/Cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc counter toturial 1'),
      ),
      body: (Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue >= 0) {
                    return Text(
                      'The Number is: ${state.counterValue}',
                      style: const TextStyle(fontSize: 22),
                    );
                  } else {
                    return Text(
                      'The number can\'t be negative:',
                      style: const TextStyle(fontSize: 22),
                    );
                  }
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
