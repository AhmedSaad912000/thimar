part of 'bloc.dart';
class ProductEvents{}
class GetProductEvent extends ProductEvents{
  final int id;
  GetProductEvent({required this.id});

}