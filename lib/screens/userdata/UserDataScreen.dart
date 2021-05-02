import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/UserData.dart';
import 'package:provider/provider.dart';

class UserDataScreen extends StatefulWidget {
  static String routeName = "/user_data"; // Router Name

  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  @override
  Widget build(BuildContext context) {
    UserData userData =Provider.of<UserData>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userData.getEmail),
            Text(userData.getPassword),
          ],
        ),
      )
    );
  }
}
