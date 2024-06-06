part of 'bloc.dart';
class RegisterEvents{}
class GetRegisterEvent extends RegisterEvents {
  final String userName,password,phone,confirmPassword;
  GetRegisterEvent( {required this.userName,required this.password,required this.phone,required this.confirmPassword});

}