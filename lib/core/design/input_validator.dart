class InputValidator{
 static String? phone(String?value){
      if(value!.isEmpty){
        return "يرجي ادخال رقم الجوال ";
      }else{
        return null;
      }

}
 static String? password(String?value) {
   if (value!.isEmpty) {
     return "يرجي ادخال كلمه المرور ";
   } else if (value.length < 7) {
     return "لابد من ادخال علي الاقل 7 ارقام ";
   } else {
     return null;
   }
 }
}