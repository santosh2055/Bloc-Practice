import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<ConterState> {
  CounterCubit(initialState) : super(ConterState(counterValue: 0,wasIncremented: true));

  void increment() => emit(ConterState(counterValue: state.counterValue + 1,wasIncremented: true));

  void decrement() => emit(ConterState(counterValue: state.counterValue - 1,wasIncremented: false));



}
