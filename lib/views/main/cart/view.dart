

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_failed.dart';
import 'package:thimar_app/core/design/app_loading.dart';
import 'package:thimar_app/core/design/my_appbar.dart';
import 'package:thimar_app/features/main/delete_from_cart/bloc.dart';
import 'package:thimar_app/features/main/get_cart/bloc.dart';
import 'package:thimar_app/features/main/update_quantity/bloc.dart';
import '../../../core/design/app_image.dart';
part 'components/items.dart';
class CartView extends StatefulWidget {
  const CartView({super.key});
  @override
  State<CartView> createState() => _CartViewState();
}
class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: MyAppBar(text: 'السلة',),
      body:Items()




    );
  }
}
