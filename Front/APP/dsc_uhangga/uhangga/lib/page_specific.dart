import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uhangga/mbti_test_pages/page_result.dart';
import 'package:uhangga/page_mainnew.dart';
import 'main.dart' as main;
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

Detail nowDetail;

class specpage extends StatefulWidget {
  final int postID;
  specpage({Key key, @required this.postID}) : super(key: key);

  @override
  _specpageState createState() => _specpageState();
}

class _specpageState extends State<specpage> {
  bool isLoading = true;

  @override
  void initState() {
    LoadDetail(widget.postID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(main.themeColor),
                ),
              )
            : CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  floating: true,
                  snap: true,
                  pinned: true,
                  expandedHeight: 285,
                  leading: IconButton(
                    icon: Icon(Icons.chevron_left_rounded),
                    color: Colors.white,
                    iconSize: 42,
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => MainPage1()));
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.favorite_outline_rounded),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.more_vert_rounded), onPressed: () {})
                  ],
                  flexibleSpace: Swiper(
                    control: SwiperControl(),
                    pagination: SwiperPagination(),
                    itemCount: nowDetail.dog.photoUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        nowDetail.dog.photoUrls[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                '${nowDetail.dog.name}',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              child: Text(
                                "${DateFormat('yyyy. MM. dd').format(nowDetail.date)}",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 5,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  height: 20,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: !nowDetail.dog.isAdopted
                                          ? const Color(0xffe06b2e)
                                          : Colors.grey,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      !nowDetail.dog.isAdopted
                                          ? 'RECRUIT'
                                          : 'RECRUITED',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: !nowDetail.dog.isAdopted
                                            ? const Color(0xffe06b2e)
                                            : Colors.grey,
                                      ),
                                    ),
                                  )),
                              Container(
                                width: 5,
                              ),
                              Container(
                                  height: 20,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: const Color(0xff2EE0B0))),
                                  child: Center(
                                    child: Text(
                                      'GOOD',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: const Color(0xff2EE0B0),
                                      ),
                                    ),
                                  ))
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Container(
                              width: 400,
                              height: 270,
                              decoration: BoxDecoration(
                                  color: const Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 68,
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          'Breed',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            ':   ${nowDetail.dog.breed}',
                                            style: TextStyle(fontSize: 16)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 3,
                                        width: 40,
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Gender',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        ':   ${nowDetail.dog.gender}',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 60,
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          'Birth Date',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        ':   ${nowDetail.dog.age} months',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          'Vaccinations',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        ':   ${nowDetail.dog.vaccination}',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 60,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          'Adoption Fee',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        ':   ${nowDetail.dog.adoptionFee}',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          'Area',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        ':   ${nowDetail.dog.area}',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: SizedBox(
                            height: 55,
                            width: 275,
                            child: RaisedButton(
                              color: const Color(0xffe06b2e),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ResultPage(
                                              mbtiName:
                                                  nowDetail.dog.characterName,
                                              isPerson: false,
                                              isInfo: true,
                                            )));
                              },
                              child: Text(
                                '${nowDetail.dog.characterName} type',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: 10,
                        width: 500,
                        decoration:
                            BoxDecoration(color: const Color(0xffF1F1F1)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // 유저 이미지 들어가는 자리
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              nowDetail.user.photo),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    '${nowDetail.user.name}',
                                    style: TextStyle(
                                      color: const Color(0xffe06b2e),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: TextButton(
                                child: Icon(
                                  Icons.phone_enabled_rounded,
                                  size: 45,
                                  color: const Color(0xffe06b2e),
                                ),
                                onPressed: () {
                                  // 전화거는 기능
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
                          height: 500,
                          width: 500,
                          child: Text(
                            '${nowDetail.dog.uniqueness}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]));
  }

  LoadDetail(postID) async {
    var response = await http.get('${main.address}/api/posts/$postID/');

    var jsonData = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      nowDetail = Detail.fromJson(jsonData);
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Faild to load Get');
    }
  }
}

class Detail {
  DateTime date;
  Dog dog;
  User user;

  Detail({this.date, this.dog, this.user});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      date: DateTime.parse(json['date']),
      dog: Dog(
        photoUrls: json['photolist'],
        name: json['dog_name'],
        isAdopted: json['isadopted'],
        breed: json['breed'],
        gender: json['gender'],
        age: json['age'],
        vaccination: json['vaccination'],
        adoptionFee: json['fee'],
        area: json['area'],
        characterId: json['dogCharacter_id'],
        characterName: json['dogCharacter_name'],
        uniqueness: json['uniqueness'],
      ),
      user: User(
        photo: json['writer_photo'],
        name: json['writer_name'],
        phonenum: json['writer_phonenum'],
      ),
    );
  }
}

class Dog {
  List<dynamic> photoUrls;
  String name;
  bool isAdopted;
  String breed;
  String gender;
  int age;
  String vaccination;
  int adoptionFee;
  String area;
  int characterId;
  String characterName;
  String uniqueness;

  Dog({
    this.photoUrls,
    this.name,
    this.isAdopted,
    this.breed,
    this.gender,
    this.age,
    this.vaccination,
    this.adoptionFee,
    this.area,
    this.characterId,
    this.characterName,
    this.uniqueness,
  });
}

class User {
  String photo;
  String name;
  String phonenum;

  User({this.photo, this.name, this.phonenum});
}
