import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_loginpage/screens/welcome_in.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Sign In"),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
          ),
          SizedBox(
            height: 8.0,
          ),
          RaisedButton(
              child: Text("Sign In"),
              onPressed: () {
                auth.signInWithEmailAndPassword(
                    email: _email, password: _password);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomeIn()));
              }),
        ],
      ),
    );
  }
}
