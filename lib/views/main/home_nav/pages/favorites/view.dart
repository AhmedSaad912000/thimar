import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/main/favorite/bloc.dart';
import '../../../../../core/design/app_failed.dart';
import '../../../../../core/design/app_image.dart';
import '../../../../../core/design/app_loading.dart';
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final bloc= KiwiContainer().resolve<FavoriteProductsBloc>()..add(GetFavoriteProductsEvent());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:Padding(
            padding:  EdgeInsets.all(16.r),
            child: Column(
              children: [
                Text('المفضله',style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
                ),),
               SizedBox(height: 24.h,),
                BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    if(state is FavoriteProductsFailedState){
                      return AppFailed(msg: state.msg);
                    }else if(state is FavoriteProductsSuccessState){
                      return GridView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.circular(17.r),
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    AppImage(state.list[index].mainImage,height: 117.h,width: 145.w,),
                                    Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: Container(
                                        height: 20.h,
                                        width: 54.w,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(10.r))
                                        ),
                                        child: Center(
                                          child: Text(
                                            '%${state.list[index].discount.toDouble()*100}',style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Tajawal',
                                              color: Colors.white
                                          ),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(state.list[index].title,style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Tajawal',
                                      color: Theme.of(context).primaryColor
                                  ),),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text('السعر/ 1 كجم',style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Tajawal',
                                    color: const Color(0xff808080),
                                  ),),
                                ),
                                Row(
                                  children: [
                                    Text('${state.list[index].price}ر.س ',style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Tajawal',
                                      color: Theme.of(context).primaryColor,
                                    ),),
                                    SizedBox(width: 3.h,),
                                    Text(state.list[index].priceBeforeDiscount.toString(),style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Tajawal',
                                      color: Theme.of(context).primaryColor,
                                    ),),
                                    const Spacer(),
                                    Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff61B80C),
                                          borderRadius: BorderRadiusDirectional.circular(6.r)
                                      ),
                                      child: Center(child: AppImage('add_to_cart.png',height: 16.h,width: 16.w,)),
                                    ),
                                  ],
                                ),
                              ],
                            )
          
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 17.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 163.w/250.h,
          
                        ),
          
                      );
                    }else{
                      return const AppLoading();
                    }
                  },)
              ],
            ),
          )
      
            ),
    );

  }
}
