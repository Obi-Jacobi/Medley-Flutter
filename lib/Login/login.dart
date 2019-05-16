import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
    TextInputWidget({@required this.textTitle, @required this.textController}) : super(key: ObjectKey(textController));

    final String textTitle;
    final TextEditingController textController;

    @override
    Widget build(BuildContext context) {
        final String title = textTitle;

        return Row(
            children: <Widget>[
                Text("$title"),
                Expanded(
                    child: Padding(
                        padding:  EdgeInsets.only(left: 15.0),
                        child: TextField(
                            controller: textController,
                            decoration: InputDecoration(
                                hintText: title, 
                            ),
                        ),
                    ), 
                ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        );
    }
}

class LoginView extends StatefulWidget {
    LoginView({Key key, @required this.title}) : super(key: key);

    final String title;

    @override
    _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    bool loginEnabled = false;

    @override 
    void initState() {
        emailController.addListener(() {
            _updateLoginEnabled();
        });
        passwordController.addListener(() {
            _updateLoginEnabled();
        });
        super.initState();
    }

    void _updateLoginEnabled() {
        setState(() {
            final emailText = emailController.text;
            final passwordText = passwordController.text;

            loginEnabled = emailText.isNotEmpty && passwordText.isNotEmpty;
        });
    }

    @override
    void dispose() {
        // Clean up the controller when disposing of the Widget.
        emailController.dispose();
        passwordController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        final loginPressed = loginEnabled ? () { debugPrint("Login Clicked"); } : null;

        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Spacer(),
                        TextInputWidget(textTitle: "Email", textController: emailController),
                        TextInputWidget(textTitle: "Password", textController: passwordController),
                        RaisedButton(
                            onPressed: loginPressed,
                            child: Text(
                                "Login"
                            ),
                        ),
                        Spacer(),
                        Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: RaisedButton(
                                onPressed: () {
                                    Navigator.pushReplacementNamed(context, "/signup");
                                },
                                child: Text(
                                    "Need to sign up?"
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    } 
}
