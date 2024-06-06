import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';

class AppInput extends StatelessWidget {
  final String? labelText;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isPhone;
  final int? maxLength;
  final int maxLines;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final String? hintText;
  final TextEditingController? controller;

  const AppInput({
    super.key,
    this.prefixIcon,
    this.maxLines = 1,
    this.isPhone = false,
    this.keyboardType,
    this.validator,
    this.controller,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.maxLength,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(16.r),
      child: IntrinsicHeight(


          child: TextFormField(
            onTap: onTap,
            maxLength: maxLength,
            maxLines: maxLines,
            controller: controller,
            validator: validator,
            inputFormatters: [
              if (isPhone) FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: keyboardType,
            decoration: InputDecoration(
              icon: isPhone
                  ? Container(
                      height: 60.h,
                      width: 69.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffF3F3F3)),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppImage(
                              'sadui.png',
                              height: 20.h,
                              width: 32.w,
                            ),
                            Text(
                              '996+',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 22.h,
                        bottom: 21.h,
                        end: 17.5.w,
                      ),
                      child: AppImage(
                        suffixIcon!,
                        height: 17.h,
                        width: 17.w,
                      ),
                    )
                  : null,
              hintText: hintText,
              labelText: labelText,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 19.h,
                        bottom: 19.h,
                        end: 10.w,
                        start: 17.5.w,
                      ),
                      child: AppImage(
                        prefixIcon!,
                        height: 22.h,
                        width: 22.w,
                      ),
                    )
                  : null,
            ),
          ),
        ),

    );
  }
}
