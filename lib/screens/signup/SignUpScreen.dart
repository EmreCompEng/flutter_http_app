import 'package:flutter/material.dart';
import '../../commons/sizeConfig.dart';
import 'components/signupBody.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up"; // Router Name
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Body()),
    );
  }
}

