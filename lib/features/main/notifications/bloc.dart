import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
part 'events.dart';

part 'states.dart';

part 'model.dart';

class NotificationsBloc extends Bloc <NotificationsEvents, NotificationsStates> {
  NotificationsBloc() :super(NotificationsStates()) {
    on<GetNotificationsEvent>(_getData);
  }

  Future<void> _getData(GetNotificationsEvent event,
      Emitter<NotificationsStates> emit) async {
    emit(NotificationsLoadingState());
    final response = await DioHelper.get('notifications');

    if (response.isSuccess) {
      final model = NotificationsModel.fromJson(response.data);
      print(model.list);
     emit(NotificationsSuccessState(list:model.list));
    } else {
      emit(NotificationsFailedState(msg: response.msg));
    }
  }
}