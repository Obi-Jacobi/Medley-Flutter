import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
    SignupView({Key key, @required this.title}) : super(key: key);

    final String title;

    @override
    _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

    @override
    Widget build(BuildContext context) {
        // final loginPressed = loginEnabled ? () { debugPrint("Login Clicked"); } : null;

        return Scaffold(
            // appBar: AppBar(
            //     title: Text(widget.title),
            // ),
            body: Center(
                child: RaisedButton(
                    onPressed: () {
                        Navigator.pushReplacementNamed(context, "login");
                    },
                    child: Text(
                        "Back to login"
                    ),
                ),
            ),
        );
    } 
}