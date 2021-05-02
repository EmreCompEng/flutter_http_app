import 'package:flutter/material.dart';
import 'package:flutter_http_app/commons/constants.dart';
import 'package:flutter_http_app/components/defaultButton.dart';
import 'package:flutter_http_app/components/formError.dart';
import 'package:flutter_http_app/model/UserData.dart';
import 'package:flutter_http_app/screens/userdata/UserDataScreen.dart';
import 'package:flutter_http_app/commons/sizeConfig.dart';
import 'package:provider/provider.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String conformPassword;
  bool remember = false;

  final List<String> errors = [];

  // Hataları ekleme
  // hatalar error: objesi ile gelir
  void addError({String error}) {
    if (!errors.contains(error)) // eğer böyle bir string içermiyorsa ekle
      setState(() {
        errors.add(error);
      });
  }

  // Hataları silme fonskiyonu
  // hatalar error: objesi ile gelir
  void removeError({String error}) {
    if (errors.contains(error)) // eğer böyle bir string var ise sil
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(), // Email
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(), // Password
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(), // Conform-Password
          FormError(errors: errors), // ERRORS
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                //SaveSharePrefData
                userData.setUserDatas(email, password);
                Navigator.pushNamed(context, UserDataScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  // Email
  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.email_outlined),
      ),
    );
  }

  // Password
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }
  // Conform-Password
  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: kMatchPassError);
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }


}
