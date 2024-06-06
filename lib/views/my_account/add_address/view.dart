import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/my_appbar.dart';
class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final location=const LatLng(37.43296265331129, -122.08832357078792);
  Set<Marker> markers={};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: 'إضافة عنوان',),
      body: SingleChildScrollView(
        padding:  EdgeInsetsDirectional.symmetric(vertical: 18.h),
        child: Column(
          children: [
            SizedBox(
              height: 600.h,
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
            SizedBox(height: 8.h,),
            const AppInput(),
            const AppInput(),
            const AppInput(),
          ],
        ),
      ),

    );
  }
}
