import 'package:flutter/material.dart';
import 'package:flutter_http_app/commons/size_config.dart';
import 'package:flutter_http_app/screens/signup/components/signup_form.dart';
import '../../../commons/constants.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  "Register Account",
                  style: headingStyle,
                ),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}