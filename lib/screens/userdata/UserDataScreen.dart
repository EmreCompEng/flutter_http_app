import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/UserData.dart';
import 'package:provider/provider.dart';

class UserDataScreen extends StatelessWidget {
  static String routeName = "/user_data"; // Router Name
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(userData.getEmail),
          Text(userData.getPassword),
        ],
      ),
    ));
  }
}
