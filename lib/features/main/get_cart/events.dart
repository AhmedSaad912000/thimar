part of 'bloc.dart';
class CartEvents {}
class GetCartEvent extends CartEvents {
  final bool isLoading;
  GetCartEvent({this.isLoading=false});
}