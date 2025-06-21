import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver
{
  
  
  @override
  void onClose(BlocBase bloc) {
    log('onClose -- ${bloc.runtimeType}');
  }
  
  @override
  void onCreate(BlocBase bloc) {
    log('onCreate -- ${bloc.runtimeType}');
  }
  
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, Error: $error');
  }
  
  @override
  void onEvent(Bloc bloc, Object? event) {
   log('onEvent -- ${bloc.runtimeType}, Event: $event');
  }
  
  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('onTransition -- ${bloc.runtimeType}, Transition: $transition');
  }
  
  @override
  void onChange(BlocBase bloc, Change change) {
   log('onChange -- ${bloc.runtimeType}, Change: $change');
  }
}