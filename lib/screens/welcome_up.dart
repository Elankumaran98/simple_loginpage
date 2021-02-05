import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_loginpage/main.dart';

class WelcomeUp extends StatefulWidget {
  @override
  _WelcomeUpState createState() => _WelcomeUpState();
}

class _WelcomeUpState extends State<WelcomeUp> {
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Text("Welcome to Kumaran Login page"),
          FlatButton(
            child: Text("Log Out"),
            onPressed: (){
              auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyApp()));
            },
          )
        ],
      ),
    );
  }
}


