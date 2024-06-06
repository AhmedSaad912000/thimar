import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class DeleteFromCartBloc
    extends Bloc <DeleteFromCartEvents, DeleteFromCartStates> {
  DeleteFromCartBloc() :super(DeleteFromCartStates()) {
    on<GetDeleteFromCartEvent>(_getData);
  }

  Future<void> _getData(GetDeleteFromCartEvent event,
      Emitter<DeleteFromCartStates> emit) async {
    emit(DeleteFromCartLoadingState());
    final response = await DioHelper.delete('client/cart/delete_item/${event.id}');
    if (response.isSuccess) {
      emit(DeleteFromCartSuccessState());
    } else {
      emit(DeleteFromCartFailedState(msg: response.msg));
    }
  }
}