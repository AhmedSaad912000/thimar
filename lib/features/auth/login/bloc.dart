import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home_nav/view.dart';
part 'events.dart';
part 'states.dart';
part 'model.dart';
class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc():super(LoginStates()){
    on<GetLoginEvent>(_sendData);
  }


  Future<void> _sendData(GetLoginEvent event, Emitter<LoginStates> emit)async {
    emit(LoginLoadingState());
    String token= await FirebaseMessaging.instance.getToken()??"test";
    print(token);
    final response=await DioHelper.send("login",data: {
      "phone":event.phone,
      "password":event.password,
      "device_token":token,
      "user_type":"client",
      "type":Platform.operatingSystem

    });
    if(response.isSuccess){
      final model=UserData.fromJson(response.data);
      model.userModel.fcmToken=token;
      CacheHelper.saveData(model.userModel);
      emit(LoginSuccessState(msg: response.msg));
    }else{
      emit(LoginFailedState(msg: response.msg));

    }

  }
}