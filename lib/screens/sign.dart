import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_loginpage/screens/welcome_in.dart';
import 'package:simple_loginpage/screens/welcome_up.dart';
import 'package:simple_loginpage/widgets/widget.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
   bool darkTheme = false;
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBarMain(context),
        body: Column(
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
              keyboardType: TextInputType.visiblePassword,
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
            Text("Sign In"),
            SizedBox(
              height: 8.0,
            ),
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
                child: Text("Sign In"),
                onPressed: () {
                  auth.signInWithEmailAndPassword(
                      email: _email, password: _password);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomeIn()));
                }),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Dark Theme"),
                trailing: Switch(
                  value: darkTheme,
                  onChanged: (changed) {
                    setState(() {
                      darkTheme = changed;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
       theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
    );
  }
}

class Bloc {
  // ignore: close_sinks
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();
