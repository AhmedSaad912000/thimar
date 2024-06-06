
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/my_appbar.dart';

class SuggestionsView extends StatelessWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: 'الأقتراحات والشكاوي',),
      body: Padding(
        padding:  EdgeInsetsDirectional.only(top: 51.h,start: 17.w,end: 17.w),
        child: Column(
          children: [
            const AppInput(
              hintText: 'الإسم',
            ),
            const AppInput(
              hintText: 'رقم الموبايل',
            ),
            const AppInput(
              maxLines: 10,
              hintText: 'الموضوع',
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              width: double.infinity,
                child: FilledButton(onPressed: (){}, child: const Text('إرسال')))
          ],
        ),
      ),
    );
  }
}
