
import 'package:bloc_3/Constants/enum.dart';
import 'package:bloc_3/Logic/Cubit/internet_cubit.dart';
import 'package:bloc_3/Logic/Cubit/internet_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  
  CounterCubit()
      : super(CounterState(counterValue: 0, wasIncremented: true)) ;

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  
}
