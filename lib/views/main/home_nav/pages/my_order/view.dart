import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_failed.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/app_loading.dart';
import 'package:thimar_app/features/main/current_order/bloc.dart';
import 'package:thimar_app/features/main/finished_order/bloc.dart';
part 'components/current.dart';
part 'components/expired.dart';
class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.only(top: 43.h,left: 18.5.w,right: 18.5.w),
            child: Column(
              children: [
                Text('طلباتي',style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Tajawal',
                  color: Theme.of(context).primaryColor
                ),),
            SizedBox(height: 27.h,),
            TabBar(
              labelColor:Colors.white,
              indicatorColor:  const Color(0xffA2A1A4),
              indicatorSize: TabBarIndicatorSize.tab,
              splashBorderRadius: BorderRadius.circular(10),
              dividerColor: Colors.white,
              indicator: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.r)
              ),
              unselectedLabelColor: const Color(0xffA2A1A4),
              labelStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal',
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal',
              ),
              tabs: const [
                Tab(text: 'الحاليه',),
                Tab(text: 'المنتهية',),
              ],
            ),
              const Expanded(
                child: TabBarView(
                    viewportFraction: 1,
                    children: [
                 CurrentSection(),
                  ExpiredSection()
                  ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
