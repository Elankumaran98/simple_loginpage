import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simple_loginpage/screens/welcome_in.dart';
import 'package:simple_loginpage/screens/welcome_up.dart';
import 'package:simple_loginpage/widgets/widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
