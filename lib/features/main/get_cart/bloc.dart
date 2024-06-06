import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

part 'model.dart';

class CartBloc extends Bloc <CartEvents, CartStates> {
  CartBloc() :super(CartStates()) {
    on<GetCartEvent>(_getData);
  }

  Future<void> _getData(GetCartEvent event, Emitter<CartStates> emit) async {
   event.isLoading?emit(CartLoadingState()):null;

    final response = await DioHelper.get('client/cart');
    if (response.isSuccess) {
      final model = CartData.fromJson(response.data);
      emit(CartSuccessState(list: model.list));
    } else {
      emit(CartFailedState(msg: response.msg));
    }
  }
}