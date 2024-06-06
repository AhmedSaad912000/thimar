part of 'bloc.dart';
class NewPasswordEvents{}
class ChangePasswordEvent extends NewPasswordEvents{
  final String password;
  final String confirmPassword;


  ChangePasswordEvent({required this.confirmPassword, required this.password});

}