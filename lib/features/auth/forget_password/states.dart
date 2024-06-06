part of 'bloc.dart';
class ForgetPasswordStates{}
class ForgetPasswordLoadingState extends ForgetPasswordStates{}
class ForgetPasswordFailedState extends ForgetPasswordStates{
 final  String msg;
  ForgetPasswordFailedState({required this.msg}){
    showMassage(msg);
  }
}
class ForgetPasswordSuccessState extends ForgetPasswordStates{
 final  String msg;
 ForgetPasswordSuccessState({required this.msg}){
    showMassage(msg,isSuccess: true);
    navigateTo(const ConfirmCodeView());
  }
}

