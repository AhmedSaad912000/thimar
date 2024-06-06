import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
part 'events.dart';
part 'states.dart';
part 'model.dart';
class ProductBloc extends Bloc <ProductEvents,ProductStates>{
  ProductBloc():super(ProductStates()){
    on<GetProductEvent>(_getData);
  }
  Future<void> _getData(GetProductEvent event, Emitter<ProductStates> emit)async {
    emit(ProductLoadingState());
    final response= await DioHelper.get('categories/${event.id}');
    if(response.isSuccess){
      final model = ProductData.fromJson(response.data);
      emit(ProductSuccessState(list: model.list));
    }else{
      emit(ProductFailedState(msg: response.msg));
    }
    
  }
}