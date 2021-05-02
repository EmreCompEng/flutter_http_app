import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_http_app/commons/size_config.dart';
import 'package:flutter_http_app/screens/signup/SignUpScreen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash_screen";
  @override
  Widget build(BuildContext context) {

    // You have to call it on your starting screen
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Center(
              child: Lottie.asset(
            'assets/lottie/covid.json',
          )),
        ),
      ),
    );
  }
}
