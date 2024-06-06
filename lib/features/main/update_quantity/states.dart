part of 'bloc.dart';

class QuantityCartStates {}

class QuantityCartLoadingState extends QuantityCartStates {}

class QuantityCartSuccessState extends QuantityCartStates {}

class QuantityCartFailedState extends QuantityCartStates {
  final String msg;
  QuantityCartFailedState({required this.msg});

}