
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';
class CounterCubit extends Cubit<CounterState> {
  CounterCubit(initialState) : super(CounterState(counterValue: 0,));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));


}
