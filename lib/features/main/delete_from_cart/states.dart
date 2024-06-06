part of 'bloc.dart';
class DeleteFromCartStates {}
class DeleteFromCartLoadingState extends DeleteFromCartStates {}
class DeleteFromCartSuccessState extends DeleteFromCartStates {
}
class DeleteFromCartFailedState extends DeleteFromCartStates {
  final String msg;
  DeleteFromCartFailedState({required this.msg});

}