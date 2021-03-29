import 'dart:io';
import 'dart:convert';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uhangga/Dog_Registration_page/page_dog_Registration.dart';
import 'package:uhangga/Dog_Registration_page/page_dog_list.dart';
import 'package:uhangga/main.dart' as main;
import 'package:uhangga/mbti_test_pages/page_result.dart';
import 'package:uhangga/page_login.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:http/http.dart' as http;
import 'package:uhangga/page_specific.dart';
import 'mbti_test_pages/page_p_test.dart';

final List<String> bannerList = ['lib/assets/pics/banner.png'];

@JsonSerializable()
class MainPage1 extends StatefulWidget {
  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  File _image;
  var _firebaseStorage = FirebaseStorage.instance;
  String _profileImageURL = '';
  Maincom maindata = Maincom();
  // Mainimglist mainlist = Mainimglist();
  List<Mainimglist> mainlist = [];

  @override
  void initState() {
    maincom();
    mainimgcom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      'lib/assets/pics/pic3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      'Your partner',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    top: 250,
                    left: 15,
                  ),
                  Positioned(
                    child: Text(
                      '${maindata.partnerType_name}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                    top: 270,
                    left: 15,
                  ),
                  Positioned(
                    child: InkWell(
                      child: Text(
                        'looking close →',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () {
                        (maindata.partnerType_name == "None")
                            ? Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => MbtiTestPage_Start(
                                          isPerson: true,
                                        )))
                            : Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ResultPage(
                                          mbtiName: maindata.partnerType_name,
                                          isInfo: true,
                                          isPerson: true,
                                        )));
                      },
                    ),
                    top: 315,
                    left: 15,
                  )
                ],
              ),
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: const Color(0xffD75B2A)),
                    child: Container(
                      height: 500,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                          ),
                          color: Colors.white),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              "${maindata.userName}",
                              style: TextStyle(
                                  color: const Color(0xff707070),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, right: 15),
                            child: showImage(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, right: 16),
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: const Color(0xff9F9F9F)),
                                height: 200,
                                width: 380,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 230,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xff9F9F9F)),
                                      height: 200,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 35,
                                          ),
                                          Container(
                                            child: Text(
                                              '${maindata.waitDogs}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'puppies waiting',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          Container(
                                            height: 8,
                                          ),
                                          Container(
                                            child: Text(
                                              '${maindata.adoptRate}%',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'adoption rate',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Colors.white),
                                height: 200,
                                width: 195,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: const Color(0xffe06b2e)),
                                height: 200,
                                width: 185,
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                    onPressed: () {
                                      if (main.myNow.token.length < 5) {
                                        // 수정
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      } else {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    DogRegiPage()));
                                      }
                                    },
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 120,
                                            child: Image.asset(
                                                'lib/assets/pics/pic1.png'),
                                          ),
                                          Container(
                                            child: Text(
                                              'Temporary protection',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Container(
                                            height: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              'Dog Registration',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 16,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'looking for my family',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff707070)),
                              ),
                            ),
                            Container(
                              child: InkWell(
                                child: Text(
                                  'more →',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => DogListPage()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 5,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: mainlist.isEmpty
                            ? Container(
                                // color: Colors.white,
                                height: 150,
                                child: Icon(
                                  Icons.block,
                                  size: 150,
                                ),
                              )
                            : Container(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: mainlist.length,
                                  itemBuilder:
                                      (BuildContext context, int index1) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            (mainlist[index1].url == '')
                                                ? Container(
                                                    height: 150,
                                                    width: 150,
                                                    child: Image.asset(
                                                      'lib/assets/pics/nullimg.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 150,
                                                    width: 150,
                                                    child: Image.network(
                                                      mainlist[index1].url,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                            Opacity(
                                              opacity: 0.7,
                                              child: Container(
                                                width: 150,
                                                color: Colors.black,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        '${mainlist[index1].name}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 22),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '${mainlist[index1].age}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]),
                                    );
                                  },
                                ),
                              ),
                      ),
                      Container(
                        height: 25,
                        color: Colors.white,
                      ),
                      Container(
                        color: Colors.white,
                        height: 150,
                        width: 650,
                        child: Swiper(
                          fade: 0,
                          pagination:
                              SwiperPagination(builder: SwiperPagination.rect),
                          itemCount: bannerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(bannerList[index]);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget showImage() {
    if (main.myNow.token == '')
      return IconButton(
        icon: Icon(Icons.account_circle_rounded),
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => LoginPage()));
        },
        iconSize: 100.0,
      );
    else {
      if (maindata.userPhoto == 'None') {
        return IconButton(
          icon: Icon(Icons.account_circle_rounded),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Test'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _uploadImageToStorage(ImageSource.gallery);
                          },
                          child: Text('Change Profile Image')),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => MainPage1()));
                          },
                          child: Text('Log Out'))
                    ],
                  );
                });
          },
          iconSize: 100.0,
        );
      } else {
        return FlatButton(
          child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(maindata.userPhoto),
                      fit: BoxFit.cover))),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Test'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Choose your image source'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            _uploadImageToStorage(
                                                ImageSource.camera);
                                          },
                                          child: Text('Camera')),
                                      TextButton(
                                          onPressed: () {
                                            _uploadImageToStorage(
                                                ImageSource.gallery);
                                          },
                                          child: Text('Gallery'))
                                    ],
                                  );
                                });
                          },
                          child: Text('Change Profile Image')),
                      TextButton(
                          onPressed: () async {
                            await logoutcom();
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => MainPage1()));
                          },
                          child: Text('Log Out'))
                    ],
                  );
                });
          },
        );
      }
    }
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

  maincom() async {
    var jsonData = null;
    var response;

    if (main.myNow.token != "") {
      // 로그인 했을때
      response = await http.get('${main.address}/api/main/index/data/',
          headers: <String, String>{
            "Authorization": "Token ${main.myNow.token}"
          });
    } else {
      // 로그인 안했을때
      response = await http.get('${main.address}/api/main/index/data/');
    }

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        maindata = Maincom.fromJson(jsonData);
      });
    } else {
      throw Exception('Something went wrong... - MainCom Fail');
    }
  }

  mainimgcom() async {
    //이미지 리스트 통신
    var jsonData1 = null;
    var response = await http.get('${main.address}/api/main/index/list/');

    if (response.statusCode == 200) {
      for (var i in json.decode(utf8.decode(response.bodyBytes))) {
        jsonData1 = i;
        mainlist.add(Mainimglist.fromJson(jsonData1));
      }

      setState(() {});
    } else {
      throw Exception('Something went wrong... - ImageList Fail');
    }
  }

  logoutcom() async {
    var response = await http.delete('${main.address}/api/auth/logout/',
        headers: <String, String>{
          "Authorization": "Token ${main.myNow.token}"
        });

    if (response.statusCode == 200) {
      setState(() {
        main.myNow.token = "";
      });
    } else {
      throw Exception('Something went wrong... - Log Out Fail');
    }
  }
}

class Maincom {
  String partnerType_name;
  String partnerType_img_url;
  String userName;
  String userPhoto;
  int waitDogs;
  int adoptRate;

  Maincom(
      {this.partnerType_name,
      this.partnerType_img_url,
      this.userName,
      this.userPhoto,
      this.waitDogs,
      this.adoptRate});

  factory Maincom.fromJson(Map<String, dynamic> json) {
    return Maincom(
        partnerType_name: json['partnerType_name'],
        partnerType_img_url: json['partnerType_img_url'],
        userName: json['userName'],
        userPhoto: json['userPhoto'],
        waitDogs: json['waitDogs'],
        adoptRate: json['adoptRate']);
  }
}

class Mainimglist {
  int id;
  String name;
  int age;
  String url;

  Mainimglist({this.id, this.name, this.age, this.url});

  factory Mainimglist.fromJson(Map<String, dynamic> json) {
    return Mainimglist(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        url: json['photoUrl']);
  }
}
