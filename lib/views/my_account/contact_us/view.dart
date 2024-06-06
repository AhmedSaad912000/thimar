import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import '../../../core/design/my_appbar.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final location=const LatLng(37.43296265331129, -122.08832357078792);
  Set<Marker> markers={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'تواصل معنا',
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsetsDirectional.all(32.r),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                SizedBox(
                  height: 198.h,
                  width: double.infinity,
                  child: GoogleMap(
                    markers:markers,
                    onTap: (argument) {
                      markers.add(Marker(markerId: MarkerId('${argument.latitude}${argument.longitude}'),position: argument));
                    },
                    initialCameraPosition: CameraPosition(
                      target:location ,
                      zoom: 18

                  ),
                ),
                ),
                Positioned(
                  right: 20,
                  left: 20,
                  child: Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
                    width: 312.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(15.r),
                    ),
                    child: Column(
                      children: List.generate(3, (index) => Padding(
                        padding:  EdgeInsetsDirectional.all(16.r ),
                        child: Row(
                          children: [
                            const AppImage('Location.svg'),
                            SizedBox(width: 8.w,),
                            Text(CacheHelper.phone)
                          ],
                        ),
                      ))
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            Text('أو يمكنك إرسال رسالة ',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w700,
            fontFamily: 'Tajawal',
              color: Theme.of(context).primaryColor
            ),),
            SizedBox(height: 17.h,),
            Container(
              padding: EdgeInsetsDirectional.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(15.r),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppInput(
                    hintText: 'الإسم',
                  ),
                  const AppInput(
                    hintText: 'رقم الموبايل',
                  ),
                  const AppInput(
                    hintText: 'الموضوع',
                    maxLines: 5,
                  ),
                  FilledButton(onPressed: (){}, child: const Text('إرسال'))
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
