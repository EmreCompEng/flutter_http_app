import 'package:flutter/material.dart';
import 'package:flutter_http_app/screens/signup/SignUpScreen.dart';
import 'package:flutter_http_app/screens/splashscreen/SplashScreen.dart';
import 'package:flutter_http_app/screens/userdata/UserDataScreen.dart';

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.routeName: (context) => SignUpScreen(),
  UserDataScreen.routeName: (context) => UserDataScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
};