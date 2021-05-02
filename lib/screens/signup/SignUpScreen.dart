import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/signup_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up"; // Router Name

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
