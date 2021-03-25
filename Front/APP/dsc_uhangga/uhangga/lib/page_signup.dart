import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uhangga/main.dart' as main;
import 'package:uhangga/mbti_test_pages/page_p_test.dart';
import 'package:http/http.dart' as http;
import 'page_login.dart';
import 'package:firebase_storage/firebase_storage.dart';

SignUpCom signupdata = SignUpCom();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
  }

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
                  CupertinoPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ),
        body: Stack(
          //첫페이지
          alignment: Alignment.bottomCenter,
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
                  Image.asset('lib/assets/pics/logo2.png'),
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
            Container(
              height: MediaQuery.of(context).size.height / 100 * 12.5,
              child: Column(
                children: [
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      elevation: 0,
                      color: const Color(0xffe06b2e),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Next →",
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 32, color: Colors.white)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AddIDPW()));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class AddIDPW extends StatefulWidget {
  //아이디 비밀번호 설정
  @override
  _AddIDPWState createState() => _AddIDPWState();
}

class _AddIDPWState extends State<AddIDPW> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  final id_Controller = TextEditingController();
  final pw_Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    id_Controller.dispose();
    pw_Controller.dispose();
  }

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
        alignment: Alignment.bottomCenter,
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
                  Container(height: 35),
                  TextFormField(
                    controller: id_Controller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: "ID"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild ID.";
                      }

                      return null;
                    },
                  ),
                  Container(height: 7),
                  TextFormField(
                    obscureText: true,
                    controller: pw_Controller,
                    decoration: InputDecoration(labelText: "Password"),
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
                    decoration: InputDecoration(labelText: "Confirm Password"),
                    validator: (String value) {
                      if (value != pw_Controller) {
                        return "Passwords do not match";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 100 * 12.5,
            child: Column(
              children: [
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    elevation: 0,
                    color: const Color(0xffe06b2e),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Next →",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                    ),
                    onPressed: () {
                      signupdata.username = id_Controller.text;
                      signupdata.password = pw_Controller.text;
                      print('id = ' + id_Controller.text);
                      print('pw = ' + pw_Controller.text);

                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => AddPhoto()));
                    },
                  ),
                ),
              ],
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
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>(); // 파베 사용
  String _profileImageURL = '';
  var _firebaseStorage = FirebaseStorage.instance;

  final fn_Controller = TextEditingController();
  final ln_Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fn_Controller.dispose();
    ln_Controller.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

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
        alignment: Alignment.bottomCenter,
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
                    child: showImage(),
                  ),
                  Container(
                    height: 60,
                    child: Text(_profileImageURL),
                  ),
                  TextFormField(
                    controller: fn_Controller,
                    decoration: InputDecoration(labelText: "First Name"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter your first name.";
                      }

                      return null;
                    },
                  ),
                  Container(height: 5),
                  TextFormField(
                    controller: ln_Controller,
                    decoration: InputDecoration(labelText: "Last Name"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter your last name.";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 100 * 12.5,
            child: Column(
              children: [
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    elevation: 0,
                    color: const Color(0xffe06b2e),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Next →",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                    ),
                    onPressed: () {
                      signupdata.first_name = fn_Controller.text;
                      signupdata.last_name = ln_Controller.text;
                      print('first name = ' + fn_Controller.text);
                      print('last name = ' + ln_Controller.text);

                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => AddPhone()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget showImage() {
    if (_image == null)
      return IconButton(
        icon: Icon(Icons.account_circle_rounded),
        onPressed: () {
          _uploadImageToStorage(ImageSource.camera);
          print(_profileImageURL);
        },
        iconSize: 100.0,
      );
    else
      return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(_profileImageURL), fit: BoxFit.fill)));
  }

  void _uploadImageToStorage(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);

    if (image == null) return;
    setState(() {
      _image = image;
    });

    StorageReference storageReference = _firebaseStorage
        .ref()
        .child("user_profile/${DateTime.now().toString()}");
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);
    await storageUploadTask.onComplete;
    String downloadURL = await storageReference.getDownloadURL();

    setState(() {
      _profileImageURL = downloadURL;
    });
  }
}

class AddPhone extends StatefulWidget {
  //휴대폰번호 추가
  @override
  _AddPhoneState createState() => _AddPhoneState();
}

class _AddPhoneState extends State<AddPhone> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  final ph_Controller = TextEditingController();
  final em_Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    ph_Controller.dispose();
    em_Controller.dispose();
  }

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
        alignment: Alignment.bottomCenter,
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
                    controller: ph_Controller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: "Phone Number"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Phone Number.";
                      }

                      return null;
                    },
                  ),
                  Container(height: 7),
                  TextFormField(
                    controller: em_Controller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email Address"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Email.";
                      }

                      return null;
                    },
                  ),
                  Container(height: 7),
                  Text(
                    "This procedure is only for Sign up identification, We will not going to use for other purposes.",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 100 * 12.5,
            child: Column(
              children: [
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    elevation: 0,
                    color: const Color(0xffe06b2e),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Next →",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                    ),
                    onPressed: () {
                      signupdata.phonenum = ph_Controller.text;
                      signupdata.email = em_Controller.text;
                      print('phone num =' + ph_Controller.text);
                      print('email =' + em_Controller.text);

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AddAddress()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddAddress extends StatefulWidget {
  //회원가입 주소추가
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  final address1_Controller = TextEditingController();
  final city_Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    address1_Controller.dispose();
    city_Controller.dispose();
  }

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
        alignment: Alignment.bottomCenter,
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
                    controller: address1_Controller,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(labelText: "Address Line"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Address";
                      }

                      return null;
                    },
                  ),
                  Container(height: 7),
                  TextFormField(
                    controller: city_Controller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "City"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a vaild Address.";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 100 * 12.5,
            child: Column(
              children: [
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    elevation: 0,
                    color: const Color(0xffe06b2e),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Next →",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                    ),
                    onPressed: () {
                      signupdata.address =
                          "${address1_Controller.text} ${city_Controller.text}";
                      print('address = ' + signupdata.address);

                      signupcom(
                          signupdata.username,
                          signupdata.password,
                          signupdata.first_name,
                          signupdata.last_name,
                          signupdata.phonenum,
                          signupdata.email,
                          signupdata.address,
                          signupdata.photourl,
                          signupdata.characterid,
                          context);

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SignUpApprove()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SignUpApprove extends StatefulWidget {
  //회원가입 마지막
  @override
  _SignUpApproveState createState() => _SignUpApproveState();
}

class _SignUpApproveState extends State<SignUpApprove> {
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
        alignment: Alignment.bottomCenter,
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
                Image.asset('lib/assets/pics/logo2.png'),
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
          Container(
            height: MediaQuery.of(context).size.height / 100 * 20,
            child: Column(
              children: [
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: const Color(0xffe06b2e))),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("No Thanks →",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 32, color: const Color(0xffe06b2e))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LoginPage()));
                    },
                  ),
                ),
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    elevation: 0,
                    color: const Color(0xffe06b2e),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Yes I do →",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  MbtiTestPage_Start())); //p_test 페이지로 이동예정
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SignUpCom {
  String username;
  String password;
  String first_name;
  String last_name;
  String phonenum;
  String email;
  String address;
  String photourl;
  int characterid;

  SignUpCom(
      {this.username,
      this.password,
      this.first_name,
      this.last_name,
      this.phonenum,
      this.email,
      this.address,
      this.photourl,
      this.characterid});

  factory SignUpCom.fromJson(Map<String, dynamic> json) {
    return SignUpCom(
      username: json['username'],
      password: json['password'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      phonenum: json['phonenum'],
      email: json['email'],
      address: json['address'],
      photourl: json['photourl'],
      characterid: json['characterid'],
    );
  }
}

signupcom(username, password, first_name, last_name, phonenum, email, address,
    photourl, characterid, context) async {
  Map data = {
    'username': username,
    'password': password,
    'first_name': first_name,
    'last_name': last_name,
    'phonenum': phonenum,
    'email': email,
    'address': address,
    'photourl': "None",
    'characterid': "17"
  };

  print(data);

  var jsonData = null;
  var response =
      await http.post('${main.address}/api/auth/signup/', body: data);
  if (response.statusCode == 200) {
    jsonData = json.decode(response.body);
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notice'),
            content: Text('Sign Up Success !'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"))
            ],
          );
        });
  }
}
