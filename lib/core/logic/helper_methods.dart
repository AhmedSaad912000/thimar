import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigateTo(Widget page, {bool keepHistory = true}) {
  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => keepHistory
  );
}

void showMassage(String msg,{bool isSuccess=false}) {
  if(msg.isNotEmpty){
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess?Colors.green:Colors.red,
        content: Text(msg),
      ),
    );
  }

}
