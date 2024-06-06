import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/aap_button.dart';
import 'package:thimar_app/features/auth/new_password/bloc.dart';
import 'package:thimar_app/views/auth/components/auth_header.dart';

import '../../../core/design/app_input.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bloc = KiwiContainer().resolve<NewPasswordBloc>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const AuthHeader(
                  text1: 'نسيت كلمة المرور', text2: 'أدخل كلمة المرور الجديدة'),
              AppInput(
                controller: passwordController,
                validator: (value) {
                  if (value != confirmPasswordController.text) {
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
                  if (value != passwordController.text) {
                    return "كلمه المرور غير متطابقه";
                  }else{
                    return null;
                  }
                },
                labelText: 'كلمة المرور',
                prefixIcon: 'password.png',
              ),
              SizedBox(
                height: 45.h,
              ),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) => AppButton(
                    isLoading: state is NewPasswordLoadingState,
                    text: 'تغيير كلمة المرور',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        bloc.add(ChangePasswordEvent(
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        ));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
