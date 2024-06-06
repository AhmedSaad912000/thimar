import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/my_appbar.dart';
import 'package:thimar_app/features/main/rate_products/bloc.dart';

class RateProductsView extends StatefulWidget {
  const RateProductsView({super.key});

  @override
  State<RateProductsView> createState() => _RateProductsViewState();
}

class _RateProductsViewState extends State<RateProductsView> {
  final bloc =KiwiContainer().resolve<RateProductsBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: 'تقييم المنتجات',),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 41.h, start: 15.w, end: 17.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AppImage('cart_test.png', height: 64.h,
                              width: 75.w,),
                            Column(
                              children: [
                                Text('طماطم', style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Theme
                                        .of(context)
                                        .primaryColor
                                ),),
                                Text('السعر / 1كجم', style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff808080)
                                ),),
                                Row(
                                  children: [
                                    Text('45 ر.س', style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme
                                            .of(context)
                                            .primaryColor
                                    ),),
                                    SizedBox(width: 3.w,),
                                    Text('56 ر.س', style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Theme
                                            .of(context)
                                            .primaryColor
                                    ),),
                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                        RatingBar.builder(
                          itemSize: 26.sp,
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 4,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                          itemBuilder: (context, _) =>
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {

                          },
                        ),

                        SizedBox(height: 15.h,),
                        const AppInput(
                          maxLines: 10,
                          hintText: 'تعليق المنتج',
                        ),
                      ],
                    ),
                  ),
                )
                , separatorBuilder: (context, index) =>
                    SizedBox(
                      height: 16.h,

                    ), itemCount: 10
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
              child: FilledButton(
                  onPressed: () {}, child: Text('تقييم', style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),)),
            ),
          ),
        ],
      ),
    );
  }
}
