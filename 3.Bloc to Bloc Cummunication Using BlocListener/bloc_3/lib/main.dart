import 'package:bloc_3/Logic/Cubit/counter_cubit.dart';
import 'package:bloc_3/Logic/Cubit/internet_cubit.dart';
import 'package:bloc_3/Presentation/Route/app_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp( 
    appRoute: AppRoute(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final AppRoute appRoute;

  const MyApp({
    Key? key,
    required this.connectivity,
    required this.appRoute,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) =>
              InternetCubit(connectivity,),
        ),
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRoute.onGeneratedRoute,
      ),
    ); 
  }
}
