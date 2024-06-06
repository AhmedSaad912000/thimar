part of '../components/../view.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  late int id;
  late int amount;
  final bloc = KiwiContainer().resolve<CartBloc>()..add(GetCartEvent());
  final deleteBloc = KiwiContainer().resolve<DeleteFromCartBloc>();
  final quantityBloc = KiwiContainer().resolve<QuantityCartBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      builder: (context, state) {
        if (state is CartSuccessState) {
          return Stack(
            children:[
              ListView.separated(
                itemCount: state.list.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 12.h,
                ),
                itemBuilder: (context, index) => Builder(builder: (context) {
                  id = state.list[index].id;
                  amount = state.list[index].amount;
                  return Container(
                    padding: EdgeInsetsDirectional.all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.1),
                      borderRadius: BorderRadiusDirectional.circular(15.r),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 6.r),
                      child: Row(
                        children: [
                          Align(
                              alignment: AlignmentDirectional.topStart,
                              child: AppImage(
                                state.list[index].image,
                                height: 78.h,
                                width: 92.w,
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            children: [
                              Text(
                                state.list[index].title,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    " ${state.list[index].price.toString()}رس ",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    "${state.list[index].priceBeforeDiscount.toString()}رس ",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.all(4.r),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius:
                                  BorderRadiusDirectional.circular(5.r),
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        amount++;
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadiusDirectional.circular(
                                              7.r),
                                        ),
                                        height: 23.h,
                                        width: 23.w,
                                        child: const AppImage('add.svg'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    BlocConsumer(
                                      bloc: quantityBloc,
                                      builder: (context, state) {
                                        return Text(
                                          amount.toString(),
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        );
                                      },
                                      listener: (context, state) {
                                        if (state is QuantityCartSuccessState) {
                                          quantityBloc.add(GetQuantityCartEvent(
                                              amount: amount));
                                          bloc.add(GetCartEvent());
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        amount--;
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadiusDirectional.circular(
                                              7.r),
                                        ),
                                        height: 23.h,
                                        width: 23.w,
                                        child: const AppImage('minus.svg'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          BlocConsumer(
                              bloc: deleteBloc,
                              builder: (context, state) {
                                return Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: IconButton(
                                        onPressed: () {
                                          deleteBloc.add(GetDeleteFromCartEvent(
                                            id: id,
                                          ));
                                          quantityBloc.add(GetQuantityCartEvent(amount: amount));
                                          bloc.add(GetCartEvent());
                                        },
                                        icon: const AppImage('delete.svg')));
                              },
                              listener: (context, state) {
                                if (state is DeleteFromCartSuccessState) {
                                  bloc.add(GetCartEvent(
                                    isLoading: false,
                                  ));
                                } else if (state is DeleteFromCartFailedState) {
                                  AppFailed(
                                    msg: state.msg,
                                  );
                                }
                              })
                        ],
                      ),
                    ),
                  );
                }),
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if(state is CartSuccessState){
                    return  Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        padding: EdgeInsetsDirectional.all(12.r),
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: EdgeInsetsDirectional.only(end: 10.w),
                                    child: Container(
                                      height: 39.h,
                                      width: 79.w,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                          child: Text(
                                            'تطبيق',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                  hintText: 'عندك كوبون ؟ ادخل رقم الكوبون',
                                  hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '  جميع الأسعار تشمل قيمة الضريبة المضافة 15%',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 13.w, vertical: 16.h),
                              child: Container(
                                padding: EdgeInsetsDirectional.all(12.r),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'إجمالي المنتجات',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).primaryColor),
                                        ),
                                       const Spacer(),
                                        Builder(
                                          builder: (context) {
                                            double totalPrice=0;
                                            for (var element in state.list) {
                                            totalPrice= totalPrice + element.priceBeforeDiscount;

                                            }

                                            return Text(
                                              totalPrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context).primaryColor),
                                            );
                                          }
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'الخصم',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).primaryColor),
                                        ),
                                        const Spacer(),
                                        Builder(
                                          builder: (context) {
                                            double discountPrice=0 ;
                                            for (var element in state.list) {
                                              discountPrice= discountPrice + element.discount;
                                            }

                                            return Text(
                                              discountPrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context).primaryColor),
                                            );
                                          }
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'المجموع',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).primaryColor),
                                        ),
                                        const Spacer(),
                                        Builder(
                                          builder: (context) {
                                            double priceAfterDiscount=0;
                                            for (var element in state.list) {
                                              priceAfterDiscount= priceAfterDiscount + element.priceBeforeDiscount-element.discount;
                                            }
                                            return Text(
                                              priceAfterDiscount.toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context).primaryColor),
                                            );
                                          }
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: () {},
                                child: const Text('الانتقال لإتمام الطلب'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const AppLoading();
                  }

                },

              ),
            ]
          );
        } else {
          return const AppLoading();
        }
      },
      listener: (context, state) {
        if (state is CartFailedState) {
          AppFailed(
            msg: state.msg,
          );
        }
      },
    );
  }
}
