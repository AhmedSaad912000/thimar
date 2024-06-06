part of 'bloc.dart';

class FavoriteProductsStates {}

class FavoriteProductsLoadingState extends FavoriteProductsStates {}

class FavoriteProductsSuccessState extends FavoriteProductsStates {
  final List<FavoriteProductsModel> list;

  FavoriteProductsSuccessState({required this.list});
}

class FavoriteProductsFailedState extends FavoriteProductsStates {
  final String msg;

  FavoriteProductsFailedState({required this.msg});

}