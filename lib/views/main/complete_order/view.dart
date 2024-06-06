import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/my_appbar.dart';

class CompleteOrderViewView extends StatefulWidget {
  const CompleteOrderViewView({super.key});

  @override
  State<CompleteOrderViewView> createState() => _CompleteOrderViewViewState();
}

class _CompleteOrderViewViewState extends State<CompleteOrderViewView> {
  int? selectedItem;
  TimeOfDay? time;
  DateTime? date;
  final controllerTime=TextEditingController();
  final controllerDate=TextEditingController();
  List<String> images = ['money_cash.svg', 'visa.svg', 'master_card.svg'];
  List<String> texts = ['كاش', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'إتمام الطلب',
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: 31.h, start: 16.w, end: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'الإسم : احمد',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'الجوال : 05068285914',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                children: [
                  Text(
                    'اختر عنوان التوصيل',
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    child: AppImage(
                      'add_to_cart.png',
                      height: 14.h,
                      width: 14.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                    padding: EdgeInsetsDirectional.only(
                        top: 8.h, bottom: 8.h, start: 16.w, end: 16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(17.r),
                    ),
                    child: Text(
                      'المنزل : 119 طريق الملك عبدالعزيز',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
              ),
              SizedBox(
                height: 40.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'تحديد وقت التوصيل',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: AppInput(
                        controller: controllerDate,
                          onTap: () async {
                            date = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 20),
                                ));
                            controllerDate.text=date.toString();

                            setState(() {});
                          },
                          hintText: 'اختر اليوم والتاريخ',
                          suffixIcon: 'date.png')),
                  Expanded(
                      child: AppInput(
                        controller: controllerTime,
                          onTap: () async {
                            time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            controllerTime.text = time.toString();
                            setState(() {});
                          },
                          hintText: 'اختر الوقت',
                          suffixIcon: 'time.png')),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'ملاحظات وتعليمات',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              const AppInput(
                maxLines: 5,
              ),
              SizedBox(
                height: 25.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'اختر طريقة الدفع',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                children: [
                  ...List.generate(
                      texts.length,
                      (index) => Padding(
                            padding: EdgeInsetsDirectional.only(end: 16.w),
                            child: GestureDetector(
                              onTap: () {
                                selectedItem = index;
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 15.w, vertical: 14.h),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedItem == index
                                          ? Theme.of(context).primaryColor
                                          : const Color(0xffC2C2C2)),
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                                child: Row(
                                  children: [
                                    AppImage(images[index]),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      texts[index],
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: selectedItem == index
                                              ? Theme.of(context).primaryColor
                                              : const Color(0xffC2C2C2)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
