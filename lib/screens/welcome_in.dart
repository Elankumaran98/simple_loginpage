import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_loginpage/main.dart';

class WelcomeIn extends StatefulWidget {
  @override
  _WelcomeInState createState() => _WelcomeInState();
}

class _WelcomeInState extends State<WelcomeIn> {
  String _username;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Text("Welcome Back" +_username),
          FlatButton(
            child: Text("Log Out"),
            onPressed: (){
              auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
            },
          )
        ],
      ),
    );
  }
}