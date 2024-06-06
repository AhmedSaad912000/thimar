import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/aap_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/input_validator.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/auth/forget_password/bloc.dart';
import 'package:thimar_app/views/auth/components/auth_header.dart';
import 'package:thimar_app/views/auth/login/view.dart';
class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final formKey=GlobalKey<FormState>();
  final bloc = KiwiContainer().resolve<ForgetPasswordBloc>();
  final phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Form(
          key:formKey ,
          child: Column(
            children: [
              const AuthHeader(text1: 'نسيت كلمة المرور', text2: 'أدخل رقم الجوال المرتبط بحسابك'),
              AppInput(
                controller: phoneController,
                validator: InputValidator.phone,
                labelText: 'رقم الجوال',
                prefixIcon: 'phone.png',
                isPhone: true,
              ),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) =>  AppButton(
                      isLoading: state is ForgetPasswordLoadingState,
                    onPress: (){
                      if(formKey.currentState!.validate()){
                        bloc.add(ConfirmPhoneEvent(phone: phoneController.text));

                      }
                    },
                    text: 'تأكيد رقم الجوال',
                  ),

                ),
              ),
              SizedBox(height: 45.h,),
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
                    onTap: (){
                    },
                    child: GestureDetector(
                      onTap: (){
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
      ),
    );
  }
}
