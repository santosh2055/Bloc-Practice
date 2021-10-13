import 'package:bloc_3/Constants/enum.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class InternetState {}

class InternetLoding extends InternetState {}

class InternetConnected extends InternetState {
  final ConntectionType conntectionType;

  InternetConnected({ required this.conntectionType});
}

class InternetDisconected extends InternetState{

}