import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/new_password/view.dart';

part 'events.dart';
part 'states.dart';
part 'model.dart';
class ConfirmCodeBloc extends Bloc<ConfirmCodeEvents,ConfirmCodeStates>{
  ConfirmCodeBloc():super(ConfirmCodeStates()){
    on<GetConfirmCodeEvent>(_sendData);
  }

  Future<void> _sendData(GetConfirmCodeEvent event, Emitter<ConfirmCodeStates> emit)async {
    emit(ConfirmCodeLoadingState());
    final response=await  DioHelper.send('resend_code',data: {
      "code":event.code,
      "phone":CacheHelper.phone
    });
    if(response.isSuccess){
      emit(ConfirmCodeSuccessState(msg: response.msg));
    }else{
      emit(ConfirmCodeFailedState(msg: response.msg));

    }

  }
}