import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{
  final String _userEmailDataKey="UserEmailDataKey";
  final String _userPasswordDataKey="UserPasswordDataKey";

  String get getUserEmailDataPrefKey =>_userEmailDataKey;
  String get getUserPasswordDataPrefKey =>_userPasswordDataKey;

  // Future async için kullanılır
  Future<String> getMailLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefHelper().getUserEmailDataPrefKey);
  }
  Future<String> getPasswordLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefHelper().getUserPasswordDataPrefKey);
  }

}