import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/auth/login/view.dart';

part 'events.dart';
part 'states.dart';
part 'model.dart';
class NewPasswordBloc extends Bloc<NewPasswordEvents,NewPasswordStates>{
  NewPasswordBloc():super(NewPasswordStates()){
    on<ChangePasswordEvent>(_sendPassword);
  }


  Future<void> _sendPassword(ChangePasswordEvent event, Emitter<NewPasswordStates> emit)async{
    emit(NewPasswordLoadingState());
    final response=await DioHelper.send("reset_password",data: {
      "password":event.password,
      "phone":"18120",
      "code":"1111",
    });
    if(response.isSuccess){
      emit(NewPasswordSuccessState(msg: response.msg));
    }else{
      emit(NewPasswordFailedState(msg: response.msg));

    }
  }
}