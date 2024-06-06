import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/my_appbar.dart';
class AddressesView extends StatelessWidget {
  const AddressesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          text: 'العناوين',
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 20.h, bottom: 8.h, start: 16.w, end: 16.w),
                      child: Container(
                        padding: EdgeInsetsDirectional.only(top: 16.h,bottom: 16.h,start: 16.w,end: 13.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'المنزل',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor),
                                ),
                                const Spacer(),
                                const AppImage('delete.svg'),
                                SizedBox(width: 10.w,),
                                AppImage('edit.png',height: 24.h,width: 24.w,),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'العنوان : 119 طريق الملك عبدالعزيز',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'الوصف',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff999797),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'رقم الجوال',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff999797),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:  EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,vertical: 20.h
                ),
                child: DottedBorder(
                  color: Theme.of(context).primaryColor,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12.r),
                  padding: EdgeInsets.all(6.r),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF9FCF5)
                    ),
                    height: 54.h,
                    child: Center(
                      child: Text('إضافة عنوان',style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor
                      ),),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
