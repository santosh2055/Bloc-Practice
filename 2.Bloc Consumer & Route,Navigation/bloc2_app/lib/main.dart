import 'package:bloc2_app/Presentation/Router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Logic/Cubit/counter_cubit.dart';
import 'Logic/Cubit/counter_state.dart';
import 'Presentation/Screen/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(CounterState),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute:_appRouter.onGeneratedRoute,
        // home: HomeScreen(),
      ),
    );
  }
}
