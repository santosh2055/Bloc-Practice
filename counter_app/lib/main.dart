import 'package:counter_app/Logic/Cubit/counter_cubit.dart';
import 'package:counter_app/Logic/Cubit/counter_state.dart';
import 'package:counter_app/presentation/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(ConterState),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocCounter(),
      ),
    );
  }
}

