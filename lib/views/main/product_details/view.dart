import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/my_appbar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(
        isFavorite: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppImage('cart_test.png'),
              SizedBox(
                height: 13.h,
              ),
              Row(
                children: [
                  Text(
                    'طماطم',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    '40%',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '45 ر.س',
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '56 ر.س',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Text(
                    'السعر / 1كجم',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff808080)),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsetsDirectional.all(4.r),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadiusDirectional.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadiusDirectional.circular(7.r),
                            ),
                            height: 23.h,
                            width: 23.w,
                            child: const AppImage('add.svg'),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadiusDirectional.circular(7.r),
                            ),
                            height: 23.h,
                            width: 23.w,
                            child: const AppImage('minus.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color(0xff808080),
              ),
              Row(
                children: [
                  Text(
                    'كود المنتج',
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Text(
                    '56638',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff808080)),
                  )
                ],
              ),
              const Divider(
                color: Color(0xff808080),
              ),
              SizedBox(
                height: 16.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'تفاصيل المنتج',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Html(
                data:
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                style: {
                  "body": Style(
                      fontSize: FontSize(14.sp),
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff757575)),
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Text(
                    'التقييمات',
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 90.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'محمد علي',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff333333)),
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      ...List.generate(
                                          5,
                                          (index) => AppImage(
                                                'Star_color.svg',
                                                height: 10.h,
                                                width: 10.w,
                                              ))
                                    ],
                                  ),
                                  const Text(
                                      'هذا النص هو مثال لنص يمكن \nأن يستبدل  .')
                                ],
                              ),
                              AppImage(
                                'cart_test.png',
                                height: 55.h,
                                width: 55.w,
                              ),
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                    itemCount: 2),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'منتجات مشابهة',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
             SizedBox(
               height: 200.h,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) =>  Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadiusDirectional.circular(17.r),
                     ),
                     child: Column(
                       children: [
                         Stack(
                           children: [
                             AppImage('cart_test.png',height: 117.h,width: 145.w,),
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
                                     '%15',style: TextStyle(
                                       fontSize: 14.sp,
                                       fontWeight: FontWeight.w700,
                                       color: Colors.white
                                   ),),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         Align(
                           alignment: AlignmentDirectional.centerStart,
                           child: Text('طماطم',style: TextStyle(
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w700,
                               color: Theme.of(context).primaryColor
                           ),),
                         ),
                         Align(
                           alignment: AlignmentDirectional.centerStart,
                           child: Text('السعر/ 1 كجم',style: TextStyle(
                             fontSize: 12.sp,
                             fontWeight: FontWeight.w300,
                             color: const Color(0xff808080),
                           ),),
                         ),
                         Row(
                           children: [
                             Text('100ر.س ',style: TextStyle(
                               fontSize: 16.sp,
                               fontWeight: FontWeight.w700,
                               color: Theme.of(context).primaryColor,
                             ),),
                             SizedBox(width: 3.h,),
                             Text('130',style: TextStyle(
                               decoration: TextDecoration.lineThrough,
                               fontSize: 13.sp,
                               fontWeight: FontWeight.w300,
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
                     ),
                   ),separatorBuilder: (context, index) => SizedBox(width: 10.w,), itemCount: 10),
             )
            ],
          ),
        ),
      ),
    );
  }
}
