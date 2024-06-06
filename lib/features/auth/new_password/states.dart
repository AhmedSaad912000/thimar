part of 'bloc.dart';
class NewPasswordStates{}
class NewPasswordLoadingState extends NewPasswordStates{}
class NewPasswordSuccessState extends NewPasswordStates{
  final String msg;
  NewPasswordSuccessState({required this.msg}){
    showMassage(msg,isSuccess: true);
    navigateTo(LoginView());
  }

}
class NewPasswordFailedState extends NewPasswordStates{
  final String msg;
  NewPasswordFailedState({required this.msg}){
    showMassage(msg);
  }

}