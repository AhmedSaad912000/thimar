part of '../view.dart';
class ExpiredSection extends StatefulWidget {
  const ExpiredSection({super.key});

  @override
  State<ExpiredSection> createState() => _ExpiredSectionState();
}

class _ExpiredSectionState extends State<ExpiredSection> {
  final bloc = KiwiContainer().resolve<FinishedOrderBloc>()..add(GetFinishedOrderEvent());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is FinishedOrderFailedState) {
          return const Center(child: AppFailed(msg: 'لا توجد طلبات '));
        } else if (state is FinishedOrderSuccessState) {
          return ListView.builder(
            itemCount: state.list.length,
            padding: EdgeInsetsDirectional.only(top: 23.h,),
            itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.r),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 10
                      ),
                    ]
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(height:4.h ,),
                        Text(
                          " طلب #${state.list[index].id.toString()} ",style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Tajawal',
                            color: Theme.of(context).primaryColor
                        ),),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffEDF5E6),
                            borderRadius: BorderRadiusDirectional.circular(7.r),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(top: 3.h,bottom: 5.h,start: 8.w,end: 16.w),
                            child: Text(state.list[index].status,style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Tajawal',
                                color: Theme.of(context).primaryColor
                            ),),
                          ) ,
                        )
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(state.list[index].date,style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Tajawal",
                        color: Color(0xff9C9C9C),

                      ),),
                    ),
                    SizedBox(height: 14.5.h,),
                    Row(
                      children: [
                        Builder(
                            builder: (context) {
                              if(state.list[index].products.length<3){
                                return Row(
                                  children: List.generate(state.list[index].products.length, (i) => SizedBox(
                                    height: 30.h,
                                    width: 30.w,
                                    child: AppImage(state.list[index].products[i].url,height: 25.h,width: 25.w,),
                                  )),
                                );
                              }else{
                                return Row(
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                      width: 30.w,
                                      child: AppImage(state.list[index].products[0].url),
                                    ), SizedBox(
                                      height: 30.h,
                                      width: 30.w,
                                      child: AppImage(state.list[index].products[1].url),
                                    ), SizedBox(
                                      height: 30.h,
                                      width: 30.w,
                                      child: AppImage(state.list[index].products[2].url),
                                    ),
                                  ],
                                );

                              }
                            }
                        ),
                        Builder(
                            builder: (context) {
                              if(state.list[index].products.length-3>0){
                                return SizedBox(
                                  height: 30.h,
                                  width: 30.w,
                                  child: Text('${state.list[index].products.length}+'),
                                );
                              }else{
                                return const SizedBox();
                              }

                            }
                        ),
                        const Spacer(),
                        Text("${state.list[index].totalPrice.toString()}ر. س ",style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Tajawal',
                            color: Theme.of(context).primaryColor
                        ),)

                      ],
                    ),
                    SizedBox(height:14.h ,)

                  ],
                )),
          );
        } else {
          return const AppLoading();
        }
      },
    );
  }
}
