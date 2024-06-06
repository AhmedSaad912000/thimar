import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/views/main/home_nav/pages/favorites/view.dart';
import 'package:thimar_app/views/main/home_nav/pages/home/view.dart';
import 'package:thimar_app/views/main/home_nav/pages/my_accont/view.dart';
import 'package:thimar_app/views/main/home_nav/pages/my_order/view.dart';
import 'package:thimar_app/views/main/home_nav/pages/notifications/view.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({super.key});

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {
  final pages = [
    const HomePage(),
    const MyOrderPage(),
    const NotificationsPage(),
    const FavoritesPage(),
    const MyAccountPage()
  ];
  final image = [
    'home.png',
    'my_order.png',
    'notifications.png',
    'favorite.png',
    'profile.png'
  ];
  final title = ['الرئيسيه', 'طلباتي', 'الاشعارات', 'المفضله', 'حسابي'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Tajawal'),
          unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'Tajawal'),
          items: List.generate(
            image.length,
            (index) => BottomNavigationBarItem(
                icon: AppImage(
                  image[index],
                  height: 21.h,
                  width: 21.w,
                ),
                label: title[index]),
          )),
    );
  }
}
