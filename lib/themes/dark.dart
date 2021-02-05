import 'package:flutter/material.dart';

class Dark extends StatefulWidget {
  @override
  _DarkState createState() => _DarkState();
}

class _DarkState extends State<Dark> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
    );
  }
}
