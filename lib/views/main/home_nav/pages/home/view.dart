import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_failed.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/app_loading.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/features/main/categories/bloc.dart';
import 'package:thimar_app/features/main/products/bloc.dart';
import 'package:thimar_app/features/main/slider/bloc.dart';

part 'components/slider.dart';
part 'components/category.dart';
part 'components/products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(16.r),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  AppImage('logo.png', height: 20.h, width: 21.w,),
                  SizedBox(width: 3.w,),
                  Text('سلة ثمار', style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w700,
                      color: Theme
                          .of(context)
                          .primaryColor
                  ),),
                  SizedBox(width: 35.w,),
                  Column(
                    children: [
                      Text('التوصيل إلى', style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w900,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      ),),
                      SizedBox(height: 5.h,),
                      Text(CacheHelper.city, style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColor,
                      ),)
                    ],
                  ),
                  const Spacer(),
                  Badge(
                    alignment: AlignmentDirectional.topStart,
                    backgroundColor: Theme
                        .of(context)
                        .primaryColor,
                    child: Container(
                      padding: EdgeInsetsDirectional.only(
                          top: 11.5.h, bottom: 6.5.h, start: 7.5.w, end: 8.w),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(9.r)
                      ),
                      child: AppImage('cart.png', height: 33.h, width: 32.w,),

                    ),
                  )

                ],
              ),
              SizedBox(height: 21.h,),
              const AppInput(
                prefixIcon: 'search.png',
                hintText: 'ابحث عن ماتريد؟',
              ),
              const SliderSection(),
              const CategoriesSection(),
              const ProductsSection(),


            ],
          ),
        ),
      ),
    );
  }
}
