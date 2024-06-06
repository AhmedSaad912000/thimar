part of 'bloc.dart';

class RateProductsStates {}

class RateProductsLoadingState extends RateProductsStates {}

class RateProductsSuccessState extends RateProductsStates {
}

class RateProductsFailedState extends RateProductsStates {
  final String msg;

  RateProductsFailedState({required this.msg});

}