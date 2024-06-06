part of 'bloc.dart';

class DeleteFromCartEvents {}

class GetDeleteFromCartEvent extends DeleteFromCartEvents {
  final int id;
  GetDeleteFromCartEvent({required this.id});


}