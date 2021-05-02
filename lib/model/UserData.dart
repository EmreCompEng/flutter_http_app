import 'package:flutter/cupertino.dart';

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

}