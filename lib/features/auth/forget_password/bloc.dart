import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../views/auth/confirm_code/view.dart';
part 'events.dart';
part 'states.dart';
part 'model.dart';
class ForgetPasswordBloc extends Bloc<ForgetPasswordEvents,ForgetPasswordStates>{
  ForgetPasswordBloc():super(ForgetPasswordStates()){
    on<ConfirmPhoneEvent>(_sendData);
  }


  Future<void> _sendData(ConfirmPhoneEvent event, Emitter<ForgetPasswordStates> emit)async {
    emit(ForgetPasswordLoadingState());
    final response=await DioHelper.send("forget_password",data: {
      "phone":event.phone
    });
    if(response.isSuccess){
      emit(ForgetPasswordSuccessState(msg: response.msg));
    }else{
      emit(ForgetPasswordFailedState(msg: response.msg));

    }

    
  }
}