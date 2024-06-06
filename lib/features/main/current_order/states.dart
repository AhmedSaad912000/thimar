part of 'bloc.dart';

class CurrentOrderStates {}

class CurrentOrderLoadingState extends CurrentOrderStates {}

class CurrentOrderSuccessState extends CurrentOrderStates {
  final List<CurrentOrderModel> list;

  CurrentOrderSuccessState({required this.list});
}
class CurrentOrderFailedState extends CurrentOrderStates {
  final String msg;

  CurrentOrderFailedState({required this.msg});

}