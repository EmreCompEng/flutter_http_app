import 'package:flutter/material.dart';
import '../../commons/size_config.dart';
import 'components/signup_body.dart';

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

