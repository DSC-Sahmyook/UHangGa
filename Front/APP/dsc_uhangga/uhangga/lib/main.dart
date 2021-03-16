import 'package:flutter/material.dart';
import 'package:uhangga/page_specific.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffe06b2e),
      ),
      home: specpage(),
    );
  }
}

final themeColor = Color(0xffe06b2e);

Now myNow = Now(token: '', statusCode: 200, statusStr: '');

class Now {
  String token;
  int statusCode;
  String statusStr;

  Now({this.token, this.statusCode, this.statusStr});
}
