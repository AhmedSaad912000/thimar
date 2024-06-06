import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home_nav/view.dart';

part 'events.dart';
part 'states.dart';
part 'model.dart';
class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterStates()){
    on<GetRegisterEvent>(_getData);
  }


  Future<void> _getData(GetRegisterEvent event, Emitter<RegisterStates> emit) async{
    emit(RegisterLoadingState());
    final response= await DioHelper.send("client_register",data: {
      "fullname":event.userName,
      "password":event.password,
      "phone":event.phone,
      "password_confirmation":event.confirmPassword,
      "city_id":"5",
      "country_id":"1",
      "gender":"female",


    });
    if(response.isSuccess){
      emit(RegisterSuccessState(msg: response.msg));
    }else{
      emit(RegisterFailedState(msg: response.msg));
    }
  }
}