part of '../components/../view.dart';
class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'ملخص الطلب',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          padding: EdgeInsetsDirectional.all(12.r),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'إجمالي المنتجات',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    '180 رس ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              SizedBox(
                height: 11.h,
              ),
              Row(
                children: [
                  Text(
                    'سعر التوصيل',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    '40 رس ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              SizedBox(
                height: 11.h,
              ),
              Row(
                children: [
                  Text(
                    'المجموع',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    '220 رس ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              SizedBox(
                height: 11.h,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('تم الدفع بواسطة', style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(width: 16.w,),
                    AppImage('visa.svg',height: 16.h,width: 51.w,)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
