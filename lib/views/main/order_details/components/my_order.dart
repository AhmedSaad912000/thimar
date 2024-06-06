part of '../components/../view.dart';
class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Text(
                " طلب # 4587 ",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffEDF5E6),
                  borderRadius: BorderRadiusDirectional.circular(7.r),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 3.h, bottom: 5.h, start: 8.w, end: 16.w),
                  child: Text(
                    'بإنتظار الموافقة',
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  '27يونيو,2021',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff9C9C9C),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "180ر. س ",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).primaryColor),
              )
            ],
          ),
          SizedBox(
            height: 14.5.h,
          ),
          Row(
            children: [
              Row(
                  children:[
                    ...List.generate(
                        3,
                            (i) => SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: AppImage(
                            'cart_test.png',
                            height: 25.h,
                            width: 25.w,
                          ),
                        )),
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: Text('2+',style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor
                      ),),
                    ),
                  ]
              ),

              const Spacer(),
              Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadiusDirectional.circular(9.r),
                ),
                child: Center(child: AppImage('back.svg',height: 11.h,width: 6.w,)),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
