part of '../components/../view.dart';
class ReachAddress extends StatelessWidget {
  const ReachAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'عنوان التوصيل',
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
          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'المنزل',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(width: 5.h,),
                  Text(
                    'شقة 40',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff999797),
                    ),
                  ),
                  SizedBox(width: 5.h,),
                  Text(
                    'شارع العليا الرياض 12521السعودية',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                   ),
                ],
              ),
              const Spacer(),
              AppImage('map.png',height: 62.h,width: 72.w,),
            ],
          ),
        ),
      ],
    );
  }
}
