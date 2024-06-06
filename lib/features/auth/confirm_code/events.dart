part of 'bloc.dart';
class ConfirmCodeEvents {}
class GetConfirmCodeEvent extends ConfirmCodeEvents{
   final String code;
   GetConfirmCodeEvent({required this.code});

}