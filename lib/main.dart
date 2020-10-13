import 'package:flutter/material.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/signupScreen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login Page",
        theme:
        ThemeData(primarySwatch: Colors.teal,),
        routes: <String, WidgetBuilder>{
          "/LoginScreen": (BuildContext context) => LoginScreen(),
          "/SignUpScreen": (BuildContext context) => SignUpScreen(),

        },
        home: LoginScreen()
    );
  }
}
