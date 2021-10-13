
import 'package:bloc_3/Logic/Cubit/counter_cubit.dart';
import 'package:bloc_3/Logic/Cubit/counter_state.dart';
import 'package:bloc_3/Presentation/Screens/home_screen.dart';
import 'package:bloc_3/Presentation/Screens/second_screen.dart';
import 'package:bloc_3/Presentation/Screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoute {
  // final CounterCubit _counterCubit = CounterCubit(CounterState);
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreeen());
        break;
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdScreen());
      default:
        return null;
    }
  }
}
