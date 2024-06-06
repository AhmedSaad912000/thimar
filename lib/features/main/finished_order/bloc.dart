import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

part 'model.dart';

class FinishedOrderBloc
    extends Bloc <FinishedOrderEvents, FinishedOrderStates> {
  FinishedOrderBloc() :super(FinishedOrderStates()) {
    on<GetFinishedOrderEvent>(_getData);
  }

  Future<void> _getData(GetFinishedOrderEvent event,
      Emitter<FinishedOrderStates> emit) async {
    emit(FinishedOrderLoadingState());
    final response = await DioHelper.get('client/orders/finished');
    if (response.isSuccess) {
      final model = FinishedOrderData.fromJson(response.data);
      emit(FinishedOrderSuccessState(list: model.list));
    } else {
      emit(FinishedOrderFailedState(msg: response.msg));
    }
  }
}