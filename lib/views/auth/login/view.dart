import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/aap_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/input_validator.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/auth/login/bloc.dart';
import 'package:thimar_app/views/auth/forget_password/view.dart';
import 'package:thimar_app/views/auth/register/view.dart';
import '../components/auth_header.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey=GlobalKey<FormState>();
  final phoneController=TextEditingController(text: '550011223344');
  final passwordController=TextEditingController(text: '123456789');
  final bloc=KiwiContainer().resolve<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Form(
          key:formKey,
          child: Column(
            children: [
             const AuthHeader(
               text1: 'مرحبا بك مرة أخرى',
               text2: 'يمكنك تسجيل الدخول الأن',
             ),
              AppInput(
                controller: phoneController,
                validator: InputValidator.phone,
                keyboardType: TextInputType.number,
                isPhone: true,
                labelText: 'رقم الجوال',
                prefixIcon: 'phone.png',
              ),
              AppInput(
                controller: passwordController,
                validator:InputValidator.password,
                labelText: 'كلمة المرور',
                prefixIcon: 'password.png',
              ),
              SizedBox(height: 6.h,),
              GestureDetector(
                onTap: (){
                  navigateTo(const ForgetPasswordView());
                },
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'نسيت كلمة المرور ؟',
                    style: TextStyle(
                      color: const Color(0xff707070),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),

                  ),
                ),
              ),
              SizedBox(height: 22.h,),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) => AppButton(
                    isLoading: state is LoginLoadingState,
                    text: 'تسجيل الدخول',
                    onPress: (){
                      if(formKey.currentState!.validate()){
                        bloc.add(GetLoginEvent(
                          phone: phoneController.text,
                          password: passwordController.text,
                        ));
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 45.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ليس لديك حساب ؟',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      navigateTo(const RegisterView());
                    },
                    child: Text(
                      'تسجيل الأن',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
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
