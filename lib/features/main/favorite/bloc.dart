import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
part 'events.dart';
 part 'states.dart';
 part 'model.dart';

class FavoriteProductsBloc extends Bloc <FavoriteProductsEvents,FavoriteProductsStates> {
  FavoriteProductsBloc() : super(FavoriteProductsStates()) {
    on<GetFavoriteProductsEvent>(_getData);
  }

  Future<void> _getData(GetFavoriteProductsEvent event,
      Emitter<FavoriteProductsStates> emit) async {
    emit(FavoriteProductsLoadingState());
    final response = await DioHelper.get('client/products/favorites');
    if (response.isSuccess) {
      final model = FavoriteProductsData.fromJson(response.data);
      emit(FavoriteProductsSuccessState(list: model.list));
    } else {
      emit(FavoriteProductsFailedState(msg: response.msg));
    }
  }
}