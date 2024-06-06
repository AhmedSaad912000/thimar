import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:thimar_app/core/design/my_appbar.dart';
class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: 'سياسة الخصوصية',),
      body: Html(
        data: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.مؤقتاً',
      ),
    );
  }
}
