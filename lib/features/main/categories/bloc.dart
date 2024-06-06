import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
part 'events.dart';
part 'states.dart';
part 'model.dart';
class CategoryBloc extends Bloc <CategoryEvents,CategoryStates>{
  CategoryBloc():super(CategoryStates()){
    on<GetCategoryEvent>(_getData);
  }
  Future<void> _getData(GetCategoryEvent event, Emitter<CategoryStates> emit)async {
    emit(CategoryLoadingState());
    final response= await DioHelper.get('categories');
    if(response.isSuccess){
      final model = CategoryData.fromJson(response.data);
      emit(CategorySuccessState(list: model.list));
    }else{
      emit(CategoryFailedState(msg: response.msg));
    }
    
  }
}