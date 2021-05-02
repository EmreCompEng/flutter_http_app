import 'package:flutter/cupertino.dart';
import 'package:flutter_http_app/commons/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends ChangeNotifier{
  String _email;
  String _password;

  String get getEmail => _email;
  String get getPassword => _password;

  void setName(String email){
    _email=email;
    notifyListeners(); // güncelleme bildirir
  }
  void setPassword(String password){
    _password=password;
    notifyListeners(); // güncelleme bildirir
  }
  void setUserDatas(String email,String password){
    _email=email;
    _password=password;
    SaveUserData(email,password);
    notifyListeners(); // güncelleme bildirir
  }

  void SaveUserData(String email, String password) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefHelper().getUserEmailDataPrefKey, email);
    await prefs.setString(SharedPrefHelper().getUserPasswordDataPrefKey, password);

  }

}