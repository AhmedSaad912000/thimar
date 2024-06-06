import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

part 'model.dart';

class RateProductsBloc extends Bloc <RateProductsEvents, RateProductsStates> {
  RateProductsBloc() :super(RateProductsStates()) {
    on<GetRateProductsEvent>(_getData);
  }
  Future<void> _getData(GetRateProductsEvent event,
      Emitter<RateProductsStates> emit) async {
    emit(RateProductsLoadingState());
    final response = await DioHelper.send('client/products/2/rate');
    if (response.isSuccess) {
      emit(RateProductsSuccessState());
    } else {
      emit(RateProductsFailedState(msg: response.msg));
    }
  }
}