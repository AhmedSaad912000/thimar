import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/kiwi.dart';
import 'package:thimar_app/views/main/home_nav/view.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initKiwi();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', ),
      startLocale: const Locale('ar'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 1059),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) {
       return MaterialApp(

         navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Thimar_app',
          theme: ThemeData(

            fontFamily: 'Tajawal',
            filledButtonTheme: FilledButtonThemeData(
                style: FilledButton.styleFrom(
              fixedSize: Size.fromHeight(60.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            )),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle:TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Tajawal',
              color: const Color(0xffB9C9A8)),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Color(0xffF3F3F3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Color(0xffF3F3F3))
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Color(0xffF3F3F3))
              ),

            ),
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff4C8613)),
            useMaterial3: true,
          ),
          home:child,
        );
      },
      child: const HomeNavView(),

    );
  }
}

