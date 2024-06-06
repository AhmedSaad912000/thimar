part of 'bloc.dart';
class LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String msg;
  LoginSuccessState({required this.msg}){
    showMassage(msg,isSuccess: true);
    navigateTo(HomeNavView());
  }
}
class LoginFailedState extends LoginStates{
  final String msg;
  LoginFailedState({required this.msg}){
    showMassage(msg);
  }

}