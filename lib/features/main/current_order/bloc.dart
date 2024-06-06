import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'events.dart';
part 'states.dart';
part 'model.dart';

class CurrentOrderBloc extends Bloc <CurrentOrderEvents, CurrentOrderStates> {
  CurrentOrderBloc() :super(CurrentOrderStates()) {
    on<GetCurrentOrderEvent>(_getData);
  }

  Future<void> _getData(GetCurrentOrderEvent event,
      Emitter<CurrentOrderStates> emit) async {
    emit(CurrentOrderLoadingState());
    final response = await DioHelper.get('client/orders/current');
   // print(response.data);

    if (response.isSuccess) {
      final model = CurrentOrderData.fromJson(response.data);
      print(CacheHelper.token);
      emit(CurrentOrderSuccessState(list: model.list));
    } else {
      emit(CurrentOrderFailedState(msg: response.msg));
    }
  }
}