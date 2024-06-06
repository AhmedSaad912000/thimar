import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

part 'model.dart';

class GetWalletBloc extends Bloc <GetWalletEvents, GetWalletStates> {
  GetWalletBloc() :super(GetWalletStates()) {
    on<GetGetWalletEvent>(_getData);
  }

  Future<void> _getData(GetGetWalletEvent event,
      Emitter<GetWalletStates> emit) async {
    emit(GetWalletLoadingState());
    final response = await DioHelper.get('wallet');
    if (response.isSuccess) {
      final model = GetWalletData.fromJson(response.data);
      emit(GetWalletSuccessState(list: model.list));
    } else {
      emit(GetWalletFailedState(msg: response.msg));
    }
  }
}