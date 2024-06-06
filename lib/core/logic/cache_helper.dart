import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimar_app/features/auth/login/bloc.dart';

class CacheHelper{
  static late SharedPreferences _preferences;
 static Future<void> init()async{
    _preferences=await SharedPreferences.getInstance();
  }
 static String get city{

 return _preferences.getString("city_name")??"";
}
static String get phone{

 return _preferences.getString("phone")??"";
}
static String get token{
  return _preferences.getString("token")??"";

}
  static String get image{
    return _preferences.getString("image")??"";

  }
  static String get name{
    return _preferences.getString("name")??"";

  }
 static void saveData(UserModel userModel){
    _preferences.setString("email", userModel.email);
    _preferences.setString("name", userModel.fullname);
    _preferences.setString("phone", userModel.phone);
    _preferences.setString("token", userModel.token);
    _preferences.setString("city_name", userModel.city.name);
    _preferences.setString("city_id", userModel.city.id);
    _preferences.setString("image", userModel.image);
    _preferences.setString("userType", userModel.userType);
    _preferences.setInt("Id", userModel.id);
    _preferences.setString("fcmToken", userModel.fcmToken);

  }

}