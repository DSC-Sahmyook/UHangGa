import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uhangga/page_main.dart';

import 'page_login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Sign Up",
            style: TextStyle(
              color: const Color(0xffe06b2e),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.chevron_left_rounded),
            color: const Color(0xffe06b2e),
            iconSize: 42,
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ),
        body: Stack(
          //첫페이지
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 25,
                  ),
                  Image.asset('lib/assets/pics/pic2.png'),
                  Container(
                    height: 25,
                  ),
                  Text(
                    "Welcome to UHangGa",
                    style: TextStyle(fontSize: 32),
                  ),
                  Container(
                    height: 15,
                  ),
                  Text(
                    "We match your personality with stray pets personality to find perfect match. So we help stray pets to find their perfect home. Register today and meet your new best friends forever. ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Container(
                    height: 250,
                  ),
                  Container(
                    height: 1,
                    width: 500,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Positioned(
              top: 600,
              left: 0,
              right: 0,
              bottom: 0,
              child: RaisedButton(
                elevation: 0,
                color: const Color(0xffe06b2e),
                child: Text("Next →",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 32, color: Colors.white)),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => AddIDPW()));
                },
              ),
            )
          ],
        ));
  }
}

class AddIDPW extends StatelessWidget {
  //아이디 비밀번호 설정
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: const Color(0xffe06b2e),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          color: const Color(0xffe06b2e),
          iconSize: 42,
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => SignUpPage()));
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formkey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(height: 75),
                  Text(
                    "Enter your ID / PW",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person), labelText: "Email Address"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Email.";
                      }

                      return null;
                    },
                  ),
                  Container(height: 7),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Password.";
                      }

                      return null;
                    },
                  ),
                  Container(height: 7),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: "ConfirmPassword"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Password was not correct.";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 0,
            right: 0,
            bottom: 0,
            child: RaisedButton(
              elevation: 0,
              color: const Color(0xffe06b2e),
              child: Text("Next →",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 32, color: Colors.white)),
              onPressed: () {
                if (_formkey1.currentState.validate()) {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => AddPhoto()));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class AddPhoto extends StatefulWidget {
  //프로필 설정
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File _image;
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: const Color(0xffe06b2e),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          color: const Color(0xffe06b2e),
          iconSize: 42,
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => AddIDPW()));
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formkey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(height: 50),
                  Text(
                    "Add your Profile",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Container(
                    height: 35,
                  ),
                  Center(
                    child: IconButton(
                      icon: Icon(Icons.account_circle_rounded),
                      onPressed: () {
                        getImage(ImageSource.gallery);
                      },
                      iconSize: 100.0,
                    ),
                  ),
                  Container(height: 65),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter your name.";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 0,
            right: 0,
            bottom: 0,
            child: RaisedButton(
              elevation: 0,
              color: const Color(0xffe06b2e),
              child: Text("Next →",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 32, color: Colors.white)),
              onPressed: () {
                if (_formkey1.currentState.validate()) {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => AddPhone()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showImage() {
    if (_image == null)
      return Container(
        child: Text("Image Not Found..."),
      );
    else
      return Image.file(_image);
  }

  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);

    setState(() {
      _image = image;
    });
  }
}

class AddPhone extends StatelessWidget {
  //휴대폰번호 추가
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: const Color(0xffe06b2e),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          color: const Color(0xffe06b2e),
          iconSize: 42,
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => AddPhoto()));
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formkey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 50),
                  Text(
                    "Add Phone Number",
                    style: TextStyle(fontSize: 32),
                  ),
                  Container(height: 15),
                  Text(
                    "and E-mail Address",
                    style: TextStyle(fontSize: 32),
                  ),
                  Container(height: 75),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Phone Number"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Phone Number.";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email Address"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Email.";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        InputDecoration(labelText: "Authorization Code"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Wrong Code!";
                      }

                      return null;
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "This procedure is only for Sign up identification, We will not going to use for other purposes.",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 0,
            right: 0,
            bottom: 0,
            child: RaisedButton(
              elevation: 0,
              color: const Color(0xffe06b2e),
              child: Text("Next →",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 32, color: Colors.white)),
              onPressed: () {
                if (_formkey1.currentState.validate()) {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => AddAddress()));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class AddAddress extends StatelessWidget {
  //회원가입 주소추가
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: const Color(0xffe06b2e),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          color: const Color(0xffe06b2e),
          iconSize: 42,
          onPressed: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => AddPhoto()));
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formkey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 50),
                  Text(
                    "Where do you live?",
                    style: TextStyle(fontSize: 32),
                  ),
                  Container(height: 60),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Address Line 1"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Address";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        InputDecoration(labelText: "Address Line 2 (OPTIONAL)"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Address";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "City"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Address.";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "State / Province"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Address.";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Country"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Country.";
                      }

                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 0,
            right: 0,
            bottom: 0,
            child: RaisedButton(
              elevation: 0,
              color: const Color(0xffe06b2e),
              child: Text("Next →",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 32, color: Colors.white)),
              onPressed: () {
                if (_formkey1.currentState.validate()) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => SignUpApprove()));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class SignUpApprove extends StatelessWidget {
  //회원가입 마지막
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: const Color(0xffe06b2e),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          color: const Color(0xffe06b2e),
          iconSize: 42,
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => AddAddress()));
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 25,
                ),
                Image.asset('lib/assets/pics/pic2.png'),
                Container(
                  height: 25,
                ),
                Text(
                  "Would you like to find a partner that fits you well?",
                  style: TextStyle(fontSize: 28),
                ),
                Container(
                  height: 15,
                ),
                Text(
                  "If you take a personality test, you can find a partner that fits you well",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Container(
                  height: 250,
                ),
              ],
            ),
          ),
          Positioned(
            top: 520,
            left: 0,
            right: 0,
            bottom: 75,
            child: RaisedButton(
              elevation: 0,
              color: const Color(0xffe06b2e),
              child: Text("No Thanks →",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 32, color: Colors.white)),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => MainPage()));
              },
            ),
          ),
          Positioned(
            top: 600,
            left: 0,
            right: 0,
            bottom: 0,
            child: RaisedButton(
              elevation: 0,
              color: Colors.white,
              child: Text("Yes I do →",
                  textAlign: TextAlign.end,
                  style:
                      TextStyle(fontSize: 32, color: const Color(0xffe06b2e))),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => LoginPage())); //p_test 페이지로 이동예정
              },
            ),
          )
        ],
      ),
    );
  }
}
