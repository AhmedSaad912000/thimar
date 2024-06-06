part of 'bloc.dart';

class GetWalletStates {}

class GetWalletLoadingState extends GetWalletStates {}

class GetWalletSuccessState extends GetWalletStates {
  final List<GetWalletModel> list;
  GetWalletSuccessState({required this.list});
}

class GetWalletFailedState extends GetWalletStates {
  final String msg;
  GetWalletFailedState({required this.msg});

}