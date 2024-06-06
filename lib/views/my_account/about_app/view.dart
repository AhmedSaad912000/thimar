import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/core/design/my_appbar.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: 'عن التطبيق',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 26.5.h,
          ),
          const AppImage('logo.png'),
          SizedBox(
            height: 25.5.h,
          ),
          Html(
            data:
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
          ),
        ],
      ),
    );
  }
}
