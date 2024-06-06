import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_failed.dart';
import 'package:thimar_app/core/design/app_loading.dart';
import 'package:thimar_app/core/design/my_appbar.dart';
import 'package:thimar_app/features/my_accont/get_wallet/bloc.dart';

import '../../../core/design/app_image.dart';

class AllTransactionsView extends StatefulWidget {
  const AllTransactionsView({super.key});

  @override
  State<AllTransactionsView> createState() => _AllTransactionsViewState();
}

class _AllTransactionsViewState extends State<AllTransactionsView> {
  final bloc= KiwiContainer().resolve<GetWalletBloc>()..add(GetWalletEvents());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: 'سجل المعاملات',),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
        if(state is GetWalletFailedState){
          return AppFailed(msg: state.msg);
        }else if(state is GetWalletSuccessState) {
          return ListView.separated(itemBuilder: (context, index) =>Container(
            padding: EdgeInsetsDirectional.only(top: 10.h,bottom: 16.h,start: 16.w,end: 13.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.r),
            ),
            child: Column(
              children: [
                ListTile(
                    leading: AppImage('charge.png',height: 18.h,width: 18.w,),
                    title: Text('شحن المحفظة', style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor

                    ),),
                    trailing: Text(state.list[index].date, style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color:const Color(0xff9C9C9C),

                    ),)),

                SizedBox(height: 8.h,),
                Text(state.list[index].amount.toString(), style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor
                )),
              ],
            ),
          ),
            itemCount:state.list.length,
            separatorBuilder: (context,index) => SizedBox(height: 20.h,),);
        }else{
          return const AppLoading();
        }
      },)
    );
  }
}
