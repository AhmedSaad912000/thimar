part of 'bloc.dart';
class ConfirmCodeStates{}
class ConfirmCodeLoadingState extends ConfirmCodeStates{}
class ConfirmCodeSuccessState extends ConfirmCodeStates{
  final String msg;
  ConfirmCodeSuccessState({required this.msg}){
    showMassage(msg,isSuccess: true);
    navigateTo(const NewPasswordView());
  }
}
class ConfirmCodeFailedState extends ConfirmCodeStates{
  final String msg;
  ConfirmCodeFailedState({required this.msg}){
    showMassage(msg);
  }
}