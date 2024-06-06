part of 'bloc.dart';
class LoginEvents{}
class GetLoginEvent extends LoginEvents{
  final  String phone;
  final String password;
  GetLoginEvent({required this.phone,required this.password});

}