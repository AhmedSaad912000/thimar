part of '../view.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  late int id;
  late ProductBloc bloc;
  @override
  void initState() {
     bloc=KiwiContainer().resolve<ProductBloc>()..add(GetProductEvent(
       id: id,
     ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text('الاصناف',style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Tajawal'
          ),),
        ),
        BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
          if(state is ProductFailedState){
            return AppFailed(msg: state.msg);
          }else if(state is ProductSuccessState){
            return GridView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) => Builder(
                builder: (context) {
                  id=state.list[index].id;
                  return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(17.r),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              AppImage(state.list[index].mainImage,height: 104.h,width: 145.w,),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Container(
                                  height: 20.h,
                                  width: 54.w,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(10.r))
                                  ),
                                  child: Center(
                                    child: Text(
                                     '%${state.list[index].discount.toDouble()*100}',style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(state.list[index].title,style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor
                            ),),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text('السعر/ 1 كجم',style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff808080),
                            ),),
                          ),
                          Row(
                            children: [
                              Text('${state.list[index].price}ر.س ',style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor,
                              ),),
                              SizedBox(width: 3.h,),
                              Text(state.list[index].priceBeforeDiscount.toString(),style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).primaryColor,
                              ),),
                              const Spacer(),
                              Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xff61B80C),
                                    borderRadius: BorderRadiusDirectional.circular(6.r)
                                ),
                                child: Center(child: AppImage('add_to_cart.png',height: 16.h,width: 16.w,)),
                              ),
                            ],
                          ),
                          FilledButton(style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xff61B80C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(9.r),
                            ),
                            fixedSize: Size.fromHeight(30.h),
                          ),onPressed: (){}, child: Text('أضف للسلة',style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Tajawal',

                          ),))

                        ],
                      )

                  );
                }
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 17.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 163.w/250.h,

              ),

            );
          }else{
            return const AppLoading();
          }
        },),
      ],
    ) ;

  }
}
