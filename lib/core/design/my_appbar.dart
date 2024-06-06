import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool isFavorite;
  const MyAppBar({super.key,  this.text='',  this.isFavorite=false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: 16.w,top: 16.h),
        child: Row(
          children: [
            Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadiusDirectional.circular(9.r),
              ),
              child: Center(child: AppImage('back.png',height: 14.h,width: 9.w,)),
            ),
          const Spacer(),
          Text(text,style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor
                  )),
            const Spacer(),
          if(isFavorite) Padding(
            padding:  EdgeInsetsDirectional.only(end: 17.w),
            child: AppImage('favorite_icon.png',height: 32.h,width: 32.w,),
          ),



          ],
        ),
      ),
    );




}

  @override
  Size get preferredSize =>Size.fromHeight(50.h);
}
