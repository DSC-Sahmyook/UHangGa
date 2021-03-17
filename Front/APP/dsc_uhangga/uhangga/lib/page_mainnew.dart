import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uhangga/Dog_Registration_page/page_dog_Registration.dart';
import 'package:uhangga/Dog_Registration_page/page_dog_list.dart';
import 'package:uhangga/main.dart' as main;
import 'package:uhangga/mbti_test_pages/page_result.dart';
import 'package:uhangga/page_login.dart';
import 'package:uhangga/page_specific.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:http/http.dart' as http;

final List<String> imgList1 = ['lib/assets/pics/banner.png'];

@JsonSerializable()
class MainPage1 extends StatefulWidget {
  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  Maincom maindata = Maincom();

  File _image;
  @override
  void initState() {
    super.initState();
    maincom();
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => ResultPage()));
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
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 8, right: 16),
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
                                          '${maindata.adoptRate}',
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
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => DogRegiPage()));
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                  ),
                  Container(
                    height: 150,
                    width: 650,
                    child: Swiper(
                      fade: 1,
                      control: SwiperControl(),
                      pagination: SwiperPagination(),
                      itemCount: imgList1.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(imgList1[index]);
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
      // 로그인 페이지로 넘어가는 코드
      return IconButton(
        icon: Icon(Icons.account_circle_rounded),
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => LoginPage()));
        },
        iconSize: 100.0,
      );
    else
      //
      return Container(
          width: 125,
          height: 125,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(maindata.userPhoto), fit: BoxFit.cover)));
  }

  Future getImage(ImageSource imageSource) async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: imageSource);

    setState(() {
      _image = image;
    });
  }

  maincom() async {
    var jsonData = null;
    var response = await http.get('${main.address}/api/main/index/data/');

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        maindata = Maincom.fromJson(jsonData);
      });
    } else {
      throw Exception('Something went wrong...');
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
