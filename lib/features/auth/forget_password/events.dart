part of 'bloc.dart';
class ForgetPasswordEvents{}
class ConfirmPhoneEvent extends ForgetPasswordEvents{
  final String phone;
  ConfirmPhoneEvent({required this.phone});

}