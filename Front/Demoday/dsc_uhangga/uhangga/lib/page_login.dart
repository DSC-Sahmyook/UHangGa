import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/page_main.dart';

import 'page_signup.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
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
                Image.asset('lib/assets/pics/pic1.png'),
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
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.person),
                                        labelText: "Email"),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "Please Enter a vaild Email.";
                                      }

                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.vpn_key),
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
                                      width: 275,
                                      child: RaisedButton(
                                        elevation: 8,
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
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        MainPage()));
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
                                      width: 275,
                                      child: RaisedButton(
                                        elevation: 8,
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
                                                BorderRadius.circular(8)),
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
}
