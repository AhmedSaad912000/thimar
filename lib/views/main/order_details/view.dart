import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_image.dart';
import '../../../core/design/my_appbar.dart';
part '../order_details//components/my_order.dart';
part '../order_details//components/order_summary.dart';
part '../order_details//components/reach_address.dart';

class CompleteOrderView extends StatelessWidget {
  final bool isCanceled;
  const CompleteOrderView({super.key, required this.isCanceled});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(text: 'تفاصيل الطلب'),
        body: Padding(
          padding:
              EdgeInsets.only(top: 21.h, right: 16.w, bottom: 16.h, left: 16.w),
          child: Column(
            children: [
              const MyOrder(),
              const ReachAddress(),
              const OrderSummary(),
              const Spacer(),
              isCanceled?FilledButton(style:FilledButton.styleFrom(
                backgroundColor: const Color(0xffFFE1E1),
              ) ,onPressed: (){}, child: Text('إلغاء الطلب',style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.red
              ),)):
              FilledButton(onPressed: (){}, child: Text('تقييم المنتجات',style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),))



            ],
          ),
        ));
  }
}
