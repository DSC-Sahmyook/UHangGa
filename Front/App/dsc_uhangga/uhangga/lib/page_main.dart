import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

final String address = ''; // 주소 받아오는 곳

final List<String> bannerImages = <String>['banner.png'];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(),
              expandedHeight: 300,
              leading: SizedBox(
                height: 150,
                width: 100,
                child: Image.asset(
                  'lib/assets/pics/pic3.png',
                  height: 160,
                  width: 170,
                ),
              )),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "NICKNAME",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 55,
                        width: 100,
                        child: IconButton(
                          onPressed: () {},
                          color: const Color(0xffe06b2e),
                          icon: Icon(Icons.account_circle_rounded),
                          iconSize: 75.0,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(address);
  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    return Post.fromJson(jsonBody);
  } else {
    throw Exception('Something went wrong...');
  }
}

class Post {
  final String partnerType;
  final String userName;
  final String userPhoto;
  final String waitDogs;
  final String adoptRate;

  Post(
      {this.partnerType,
      this.userName,
      this.userPhoto,
      this.waitDogs,
      this.adoptRate});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      partnerType: json['partnerType'],
      userName: json['userName'],
      userPhoto: json['userphoto'],
      waitDogs: json['waitDogs'],
      adoptRate: json['adoptRate'],
    );
  }
}
