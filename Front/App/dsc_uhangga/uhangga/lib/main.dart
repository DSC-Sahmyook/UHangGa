//import 'package:dsc_project/page_login.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/page_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffe06b2e),
        fontFamily: 'segoe',
      ),
      home: MainPage(),
    );
  }
}

final themeColor = Color(0xffe06b2e);