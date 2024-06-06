import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_loading.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final void Function()? onPress;
  final bool isLoading;

  const AppButton({super.key, this.text, this.onPress,  this.isLoading=false});

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return const AppLoading();
    }else {
      return FilledButton(
        onPressed: onPress,
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ));
    }
  }
}
