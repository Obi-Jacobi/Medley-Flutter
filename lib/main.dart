import 'package:flutter/material.dart';
import 'package:medley_flutter/Login/login.dart';
import 'package:medley_flutter/Signup/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medley',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
        home: LoginView(title: "Login"),
        routes: {
            "login": (context) => LoginView(title: "Login"), 
            "/signup": (context) => SignupView(title: "Signup"),
        },
    );
  }
}
