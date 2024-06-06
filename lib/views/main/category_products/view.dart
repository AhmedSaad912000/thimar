import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/my_appbar.dart';
import '../../../core/design/app_failed.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_input.dart';
import '../../../core/design/app_loading.dart';
import '../../../features/main/products/bloc.dart';
class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({super.key});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  late int id;
  late ProductBloc bloc;
  @override
  void initState() {
     bloc = KiwiContainer().resolve<ProductBloc>()..add(GetProductEvent(
       id: id,
     ));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'خضروات',
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const AppInput(
              prefixIcon: 'search.png',
              hintText: 'ابحث عن ماتريد؟',
            ),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is ProductFailedState) {
                  return AppFailed(msg: state.msg);
                } else if (state is ProductSuccessState) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (context, index) => Builder(
                        builder: (context) {
                          id=state.list[index].id;
                          return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(17.r),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      AppImage(
                                        state.list[index].mainImage,
                                        height: 97.h,
                                        width: 145.w,
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.topEnd,
                                        child: Container(
                                          height: 20.h,
                                          width: 54.w,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context).primaryColor,
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                      topEnd:
                                                          Radius.circular(10.r))),
                                          child: Center(
                                            child: Text(
                                              '%${state.list[index].discount.toDouble() * 100}',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      state.list[index].title,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      'السعر/ 1 كجم',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color: const Color(0xff808080),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${state.list[index].price}ر.س ',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.h,
                                      ),
                                      Text(
                                        state.list[index].priceBeforeDiscount
                                            .toString(),
                                        style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff61B80C),
                                            borderRadius:
                                                BorderRadiusDirectional.circular(
                                                    6.r)),
                                        child: Center(
                                            child: AppImage(
                                          'add_to_cart.png',
                                          height: 16.h,
                                          width: 16.w,
                                        )),
                                      ),
                                    ],
                                  ),
                                  FilledButton(
                                      style: FilledButton.styleFrom(
                                        backgroundColor: const Color(0xff61B80C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(9.r),
                                        ),
                                        fixedSize: Size.fromHeight(30.h),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'أضف للسلة',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Tajawal',
                                        ),
                                      ))
                                ],
                              ));
                        }
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 17.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 163.w / 250.h,
                      ),
                    ),
                  );
                } else {
                  return const AppLoading();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
