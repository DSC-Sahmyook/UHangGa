import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/page_mainnew.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'com.dart' as com;

import 'page_signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(color: const Color(0xffE06B2E)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 50,
                ),
                Image.asset('lib/assets/pics/logo1.png'),
                Container(
                  height: 15,
                ),
                Text(
                  'Sign in to UHangGa',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 31,
                      color: Colors.white),
                ),
                Container(
                  height: 25,
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _idController,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.person),
                                        labelText: "ID"),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "Please Enter a vaild ID.";
                                      }

                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.lock_rounded),
                                        labelText: "Password"),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "Please Enter a vaild Password.";
                                      }

                                      return null;
                                    },
                                  ),
                                  Container(
                                    height: 16,
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Text("Forgot Password?",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17,
                                              decoration:
                                                  TextDecoration.underline))),
                                  Container(
                                    height: 90,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 315,
                                      child: RaisedButton(
                                        elevation: 0,
                                        color: const Color(0xffe06b2e),
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            await signIn(_idController.text,
                                                _passwordController.text);

                                            if (myNow.statusCode == 200) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          MainPage1()));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor: Colors.white,
                                                elevation: 10,
                                                content: Text(
                                                  myNow.statusStr,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ));
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 12,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 315,
                                      child: RaisedButton(
                                        elevation: 0,
                                        color: Colors.white,
                                        child: Text(
                                          "Create Account",
                                          style: TextStyle(
                                              color: const Color(0xffe06b2e),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: BorderSide(
                                                color:
                                                    const Color(0xffe06b2e))),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      SignUpPage()));
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.07,
                ),
              ],
            )
          ],
        ));
  }

  signIn(username, password) async {
    Map login_data = {
      "username": username,
      "password": password,
    };

    var jsonData = null;
    var response =
        await http.post('${com.address}/api/auth/signin/', body: login_data);

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        myNow = Now(
            token: jsonData['token'],
            statusCode: 200,
            statusStr: "Success Login");
      });
    } else {
      setState(() {
        myNow = Now(
            token: "",
            statusCode: response.statusCode,
            statusStr: "Faild Login");
      });
    }
  }
}
