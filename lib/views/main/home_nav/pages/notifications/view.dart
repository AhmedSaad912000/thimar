import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_failed.dart';
import 'package:thimar_app/core/design/app_loading.dart';
import 'package:thimar_app/features/main/notifications/bloc.dart';
import '../../../../../core/design/app_image.dart';
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final bloc = KiwiContainer().resolve<NotificationsBloc>()..add(GetNotificationsEvent());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(16.r),
          child: Column(
            children: [
            Text(
              'الاشعارات',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor),
            ),
                SizedBox(
          height: 24.h,
                ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is NotificationsFailedState) {
                    return AppFailed(msg: state.msg);
                  } else if (state is NotificationsSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.list.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                          ListTile(
                            leading: AppImage(state.list[index].image, height: 33.h, width: 33.w,),
                            title: Text(state.list[index].title, style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),),
                            subtitle: Column(
                              children: [
                                Text(state.list[index].body, style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff989898),
                                ),),
                                Text(state.list[index].createdAt, style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ],
                            ),
                          ),
                      ),
                    );
                  } else {
                    return const AppLoading();
                  }
                }
            ),
          ],
          ),
        ),
      ),
    );

  }
}
