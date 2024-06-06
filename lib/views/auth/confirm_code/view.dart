import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_app/core/design/aap_button.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/features/auth/confirm_code/bloc.dart';
import 'package:thimar_app/views/auth/components/auth_header.dart';
import 'package:thimar_app/views/auth/forget_password/view.dart';

import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';

class ConfirmCodeView extends StatefulWidget {
  const ConfirmCodeView({super.key});

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final bloc = KiwiContainer().resolve<ConfirmCodeBloc>();
  late Color? color = const Color(0xff4C8613);
  final controller = CountDownController();
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Column(
          children: [
            AuthHeader(
                text1: 'نسيت كلمة المرور',
                text2:
                    'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال${CacheHelper.phone}'),
            GestureDetector(
              onTap: (){
                navigateTo(const ForgetPasswordView());
              },
              child: Text(
                'تغيير رقم الجوال',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Tajawal',
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 20.h,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: PinCodeTextField(
                onCompleted: (value) {
                  code = value;
                },
                length: 4,
                appContext: context,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15.r),
                  fieldHeight: 60.h,
                  fieldWidth: 70.w,
                  selectedFillColor: Colors.red,
                  activeFillColor: Colors.green,
                  inactiveFillColor: Colors.yellow,
                  activeColor: Theme.of(context).primaryColor,
                  selectedColor: Theme.of(context).primaryColor,
                  inactiveColor: const Color(0xffF3F3F3),
                ),
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) => AppButton(
                  isLoading: state is ConfirmCodeLoadingState,
                  onPress: () {
                    bloc.add(GetConfirmCodeEvent(code: code));
                  },
                  text: "تأكيد الكود",
                ),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Text(
              'لم تستلم الكود ؟ '
              '\n يمكنك إعادة إرسال الكود بعد',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Tajawal",
                  color: const Color(0xff707070)),
            ),
            SizedBox(
              height: 22.h,
            ),
            CircularCountDownTimer(
              controller: controller,
              strokeWidth: 4.r,
              duration: 120,
              height: 69.h,
              width: 66.w,
              fillColor: Theme.of(context).primaryColor,
              ringColor: Colors.grey[300]!,
              isReverse: true,
              isReverseAnimation: true,
              textStyle: TextStyle(
                fontSize: 21.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w400,
              ),
              onComplete: () {
                color = Theme.of(context).primaryColor;
                setState(() {});
              },
              onStart: () {
                color = Colors.grey;
                setState(() {});
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              onPressed: color == Theme.of(context).primaryColor
                  ? () {
                      controller.restart(duration: 120);
                      setState(() {});
                    }
                  : null,
              child: Text(
                'إعادة الإرسال',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Tajawal',
                ),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لديك حساب بالفعل ؟',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      navigateTo(const LoginView());
                    },
                    child: Text(
                      ' تسجيل الدخول',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: Theme.of(context).primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
