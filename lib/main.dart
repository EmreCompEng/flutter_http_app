import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/UserData.dart';
import 'package:flutter_http_app/commons/routes.dart';
import 'package:flutter_http_app/screens/futureBuilderScreen/FutureBuilderScreen.dart';
import 'package:flutter_http_app/screens/splashscreen/SplashScreen.dart';
import 'package:flutter_http_app/commons/sizeConfig.dart';
import 'package:flutter_http_app/commons/theme.dart';
import 'package:flutter_http_app/screens/signup/SignUpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import 'model/UserModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Notifier tanımı burada yapılması gerekir
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: FutureBuilderScreen.routeName,
        routes: routes,
        title: 'Flutter Demo',
        theme: theme(),
        home: SplashScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<UserModel> createUser(String name, String jobTitle) async {
  final String apiUrl = "https://reqres.in/api/users";
  var url = Uri.parse(
      apiUrl); // Uri tipinde değer aldığı için convert işlemi uygulandı

  // Request -> Response
  final response = await http.post(url, body: {
    "name": name,
    "job": jobTitle,
  });

  // if status correct
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: jobController,
            ),
            SizedBox(
              height: 32,
            ),
            // control
            _user == null
                ? Container() // _user null ise
                : Text(// _user null değil ise
                    "The User ${_user.name} , created At: ${_user.createdAt.toIso8601String()}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String jobTitle = jobController.text;
          final UserModel user = await createUser(name, jobTitle);

          setState(() {
            _user = user;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
