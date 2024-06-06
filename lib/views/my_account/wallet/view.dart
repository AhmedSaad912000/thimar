import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/my_appbar.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'المحفظة',
      ),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 30.h, horizontal: 16.w),
        child: Column(
          children: [
            Container(
              height: 183.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'رصيدك',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text('255 ر.س',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            DottedBorder(
              color: Theme.of(context).primaryColor,
              borderType: BorderType.RRect,
              radius: Radius.circular(12.r),
              padding: EdgeInsets.all(6.r),
              child: Container(
                decoration: const BoxDecoration(color: Color(0xffF9FCF5)),
                height: 54.h,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.all(16.r),
                          title: Center(
                            child: Text(
                              'شحن المحفظة ',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'ادخل المبلغ المطلوب ',
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  'ر.س',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            FilledButton(onPressed: () {}, child: const Text('تطبيق'))
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'اشحن الآن',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                Text(
                  'سجل المعاملات',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
                const Spacer(),
                Text(
                  'عرض الكل',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsetsDirectional.only(
                      top: 10.h, bottom: 16.h, start: 16.w, end: 13.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                          leading: AppImage(
                            'charge.png',
                            height: 18.h,
                            width: 18.w,
                          ),
                          title: Text(
                            'شحن المحفظة',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor),
                          ),
                          trailing: Text(
                            '27يونيو,2021,',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff9C9C9C),
                            ),
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('255 ر.س',
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ],
                  ),
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
