part of 'bloc.dart';
class RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  final String msg;
  RegisterSuccessState({required this.msg}){
    showMassage(msg,isSuccess: true);
    navigateTo(HomeNavView());
  }


}
class RegisterFailedState extends RegisterStates{
  final String msg;
  RegisterFailedState({required this.msg}){
    showMassage(msg);
  }

}