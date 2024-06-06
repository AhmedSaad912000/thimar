part of 'bloc.dart';
class CategoryStates{}
class CategoryLoadingState extends CategoryStates{}
class CategorySuccessState extends CategoryStates{
  final List<CategoryModel> list;
  CategorySuccessState({required this.list});
}
class CategoryFailedState extends CategoryStates{
  final String msg;
  CategoryFailedState({required this.msg});

}