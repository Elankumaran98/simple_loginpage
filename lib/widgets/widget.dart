import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Text("Log In Page"),
  );
}

InputDecoration textInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.lightBlue),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)));
}


