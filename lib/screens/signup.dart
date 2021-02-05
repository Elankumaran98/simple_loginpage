import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_loginpage/screens/welcome_up.dart';
import 'package:simple_loginpage/widgets/widget.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email,_password;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Column(
        children: [
          SizedBox(height: 16.0),
          Text("SignUp"),
          TextField(
            decoration: textInputDecoration("Email"),
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
            decoration: textInputDecoration("Password"),
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
              child: Text("Sign Up"),
              onPressed: () {
                auth.createUserWithEmailAndPassword(
                    email: _email, password: _password);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomeUp()));
              }),
        ],
      ),);
  }
}