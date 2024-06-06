import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'events.dart';
part 'states.dart';
class QuantityCartBloc extends Bloc <QuantityCartEvents, QuantityCartStates> {
  QuantityCartBloc() :super(QuantityCartStates()) {
    on<GetQuantityCartEvent>(_getData);
  }

  Future<void> _getData(GetQuantityCartEvent event,
      Emitter<QuantityCartStates> emit) async {
    emit(QuantityCartLoadingState());
    final response = await DioHelper.put('client/cart/${event.amount}');
    if (response.isSuccess) {
      emit(QuantityCartSuccessState());
    } else {
      emit(QuantityCartFailedState(msg: response.msg));
    }
  }
}