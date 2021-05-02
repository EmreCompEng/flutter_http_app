import 'package:flutter/material.dart';
import 'package:flutter_http_app/commons/sharedPrefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FutureBuilderScreen extends StatefulWidget {
  static String routeName = "/future_builder_screen";

  @override
  _FutureBuilderScreenState createState() => _FutureBuilderScreenState();
}

/// Eğer FutureBuilder Kullanılacaksa mutlaka init satate içinde future değeri belirtilmelidir
/// Dönüş tipi future olmalıdır ,
/// en basit Kullanımı bu örnektir
//

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  Future userDatafuture;

  @override
  void initState() {
    super.initState();
    userDatafuture = SharedPrefHelper.getMailLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: userDatafuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("none");
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Text("waiting...");
                case ConnectionState.done:
                  return Text(snapshot.data);
                default:
                  return Text("default");
              }
            },
          ),
        ),
      ),
    );
  }
}
