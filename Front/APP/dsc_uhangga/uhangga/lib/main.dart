import 'package:flutter/material.dart';
import 'package:uhangga/page_mainnew.dart';

// final String address = 'https://dsc-uhg-306513.du.r.appspot.com'; // 주소 받아오는 곳
final String address = 'https://df8eaee0ba5d.ngrok.io';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

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

Now myNow = Now(token: '', statusCode: 200, statusStr: '');

class Now {
  String token;
  int statusCode;
  String statusStr;

  Now({this.token, this.statusCode, this.statusStr});
}
