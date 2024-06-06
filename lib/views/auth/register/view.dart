import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/aap_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/input_validator.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/auth/register/bloc.dart';
import 'package:thimar_app/views/auth/components/auth_header.dart';
import 'package:thimar_app/views/auth/login/view.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}
class _RegisterViewState extends State<RegisterView> {
  final formKey=GlobalKey<FormState>();
  final userController=TextEditingController();
  final phoneController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final cityController=TextEditingController();
  final bloc = KiwiContainer().resolve<RegisterBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Form(
          key:formKey,
          child: Column(
            children: [
              const AuthHeader(text1: 'مرحبا بك مرة أخرى', text2: 'يمكنك تسجيل حساب جديد الأن',),
              AppInput(
                controller: userController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'يرجي ادخال اسم المستخدم';
                  }else{
                    return null;
                  }
                },
                labelText: 'اسم المستخدم',
                prefixIcon: 'user.png',
              ),
              AppInput(
                controller: phoneController,
                validator: InputValidator.phone,
                isPhone: true,
                labelText: 'رقم الجوال',
                prefixIcon: 'phone.png',
              ),
              AppInput(
                controller: cityController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'يرجي ادخال المدينه';
                  }else{
                    return null;
                  }
                },
                labelText: 'المدينة',
                prefixIcon: 'city.png',
              ),
              AppInput(
                controller: passwordController,
                validator: (value) {
                  if(value!=confirmPasswordController.text){
                    return "كلمه المرور غير متطابقه";
                  }else{
                    return null;
                  }
                },
                labelText: 'كلمة المرور',
                prefixIcon: 'password.png',
              ),
              AppInput(
                controller: confirmPasswordController,
                validator: (value) {
                  if(value!=passwordController.text){
                    return "كلمه المرور غير متطابقه";
                  }else{
                    return null;
                  }
                },
                labelText: 'كلمة المرور',
                prefixIcon: 'password.png',
              ),
              SizedBox(
                width: double.infinity,
                child:BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) =>  AppButton(
                    isLoading: state is RegisterLoadingState,
                    text: 'تسجيل',
                    onPress: (){
                      if(formKey.currentState!.validate()){
                        bloc.add(GetRegisterEvent(
                            userName: userController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            phone: phoneController.text,

                        ));
                      }
                    },
                  ),
                )
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
