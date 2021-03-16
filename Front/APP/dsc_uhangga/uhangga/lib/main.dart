//import 'package:dsc_project/page_login.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/mbti_test_pages/page_result.dart';
import 'package:uhangga/page_login.dart';
import 'package:uhangga/page_mainnew.dart';
import 'package:uhangga/page_signup.dart';
import 'package:uhangga/page_specific.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffe06b2e),
      ),
      home: MainPage1(),
    );
  }
}

final themeColor = Color(0xffe06b2e);
