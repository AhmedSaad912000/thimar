part of 'bloc.dart';

class CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  final List<CartModel> list;

  CartSuccessState({required this.list});
}

class CartFailedState extends CartStates {
  final String msg;

  CartFailedState({required this.msg});

}