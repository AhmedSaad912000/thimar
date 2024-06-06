part of '../components/../view.dart';

class _Item extends StatelessWidget {
  final String leading;
  final String title;
  final bool isLogout;

  const _Item({
    this.leading = '',
    this.title = '',  this.isLogout=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 30.h),
      child: ListTile(
        leading: AppImage(
          leading,
          height: 18.h,
          width: 14.w,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        trailing: isLogout?AppImage(
          'log_out.png',
          height: 18.h,
          width: 14.w,
        ):AppImage(
          'go_to.svg',
          height: 18.h,
          width: 14.w,
        ),
      ),
    );
  }
}
