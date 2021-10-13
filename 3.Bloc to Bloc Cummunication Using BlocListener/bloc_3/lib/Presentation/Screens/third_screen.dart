// ignore_for_file: prefer_const_constructors

import 'package:bloc_3/Logic/Cubit/counter_cubit.dart';
import 'package:bloc_3/Logic/Cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text('Third  Screen'),
      ),
      body: (
        Container(
        alignment: Alignment.center,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 20),
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
                    style:  TextStyle(fontSize: 22),
                  );
                },
              ),
              Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: 1,
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      child:  Icon(Icons.add),
                    ),
                     Spacer(),
                    FloatingActionButton(
                      heroTag: 2,
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      child:  Icon(Icons.remove),
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
