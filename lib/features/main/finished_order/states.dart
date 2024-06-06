part of 'bloc.dart';

class FinishedOrderStates {}

class FinishedOrderLoadingState extends FinishedOrderStates {}

class FinishedOrderSuccessState extends FinishedOrderStates {
  final List<FinishedOrderModel> list;

  FinishedOrderSuccessState({required this.list});
}

class FinishedOrderFailedState extends FinishedOrderStates {
  final String msg;

  FinishedOrderFailedState({required this.msg});

}