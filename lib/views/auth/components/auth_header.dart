import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/design/app_image.dart';
class AuthHeader extends StatelessWidget {
  final String text1,text2;
  const AuthHeader({super.key, required this.text1, required this.text2});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 21.h,
        ),
        AppImage(
          'logo.png',
          height: 126.h,
          width: 130.w,
        ),
        SizedBox(
          height: 21.h,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
           text1,
            style: TextStyle(
              fontFamily: 'Tajawal',
              color: Theme.of(context).primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            text2,
            style: TextStyle(
              color: const Color(0xff707070),
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: 28.h,
        ),
      ],
    );
  }
}
