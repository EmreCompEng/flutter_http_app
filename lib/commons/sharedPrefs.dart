import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String emailPrefKey = "UserEmailDataKey";
  static const String passwordPrefKey = "UserPasswordDataKey";

  // Future async için kullanılır
  static Future<String> getMailLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailPrefKey);
  }

  static Future<String> getPasswordLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(passwordPrefKey);
  }
}
