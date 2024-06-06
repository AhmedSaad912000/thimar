part of 'bloc.dart';
class ProductStates{}
class ProductLoadingState extends ProductStates{}
class ProductSuccessState extends ProductStates{
  final List<ProductModel> list;
  ProductSuccessState({required this.list});
}
class ProductFailedState extends ProductStates{
  final String msg;
  ProductFailedState({required this.msg});

}