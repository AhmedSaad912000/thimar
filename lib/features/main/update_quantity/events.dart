part of 'bloc.dart';

class QuantityCartEvents {}

class GetQuantityCartEvent extends QuantityCartEvents {
  final int amount;
  GetQuantityCartEvent({required this.amount});

}