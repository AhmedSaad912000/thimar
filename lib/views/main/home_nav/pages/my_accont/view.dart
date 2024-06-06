import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
part 'components/item.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(40.r),
                  bottomStart: Radius.circular(40.r),
                )),
                child: Column(
                  children: [
                    Text(
                      'حسابي',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    AppImage(
                      CacheHelper.image,
                      height: 71.h,
                      width: 76.w,
                    ),
                    Text(
                      CacheHelper.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      CacheHelper.phone,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xffA2D273),
                      ),
                    )
                  ],
                ),
              ),
              const _Item(
                leading: 'my_account.png',
                title: 'البيانات الشخصية',
          
              ),
              const _Item(
                leading: 'wallet.png',
                title: 'المحفظة',
          
              ),
              const _Item(
                leading: 'addresses.png',
                title: 'العناوين',
          
              ),
              const _Item(
                leading: 'payment.png',
                title: 'الدفع',
          
              ),
              const _Item(
                leading: 'faqs.png',
                title: 'اسئله متكرره',
          
              ),
              const _Item(
                leading: 'privacy.png',
                title: 'سياسه الخصوصيه',
          
              ),

              const _Item(
                leading: 'contact_us.png',
                title: 'تواصل معنا',
          
              ),
              const _Item(
                leading: 'suggestions.png',
                title: 'الشكاوي والاقتراحات',
          
              ),
              const _Item(
                leading: 'share.png',
                title: 'مشاركه التطبيق',
              ),
              const _Item(
                leading: 'about_app.png',
                title: 'عن التطبيق',
              ),
              const _Item(
                leading: 'language.png',
                title: 'تغيير اللغة',
              ),
              const _Item(
                leading: 'conditions.png',
                title: 'الشروط والأحكام',
              ),
              const _Item(
                leading: 'product_rate.png',
                title: 'تقييم التطبيق',
              ),
              const _Item(
                isLogout: true,
                title: 'تسجيل الخروج',
              ),


            ],
          ),
        ),
      ),
    );
  }
}
