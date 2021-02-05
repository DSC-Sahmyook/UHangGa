//import 'package:dsc_project/page_login.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/page_main.dart';

import 'Dog_Registration_page/page_dog_Registration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffe06b2e),
        fontFamily: 'segoe',
      ),
      // home: MainPage(),
      home: DogRegiPage(),
    );
  }
}

final themeColor = Color(0xffe06b2e);
