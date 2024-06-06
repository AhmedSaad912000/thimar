import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
part 'events.dart';
part 'states.dart';
part 'model.dart';

class SliderBloc extends Bloc<SliderEvents,SliderStates> {
  SliderBloc() : super(SliderStates()) {
    on<GetSliderEvent>(_getData);
  }

  Future<void> _getData(
    GetSliderEvent event,
    Emitter<SliderStates> emit,
  )async {
    emit(SliderLoadingState());
    final response=await DioHelper.get('sliders');
    if(response.isSuccess){
      final model=SliderData.fromJson(response.data);
      emit(SliderSuccessState(list: model.list));
    }else{
      emit(SliderFailedState(msg: response.msg));
    }
  }
}
