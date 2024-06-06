import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';

class CitiesSheet extends StatelessWidget {
  const CitiesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) =>Text(CacheHelper.city),
        separatorBuilder: (context, index) => SizedBox(height: 16.h,),
        itemCount: 10
    );
  }
}
