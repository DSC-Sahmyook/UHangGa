import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import '../main.dart' as main;
import '../page_mainnew.dart';
import '../Dog_Registration_page/page_dog_list.dart';
import 'package:uhangga/page_specific.dart' as spec;
import 'dart:convert';

import 'page_d_test.dart';
import '../Dog_Registration_page/page_dog_Registration.dart' as regist;

class Result {
  List<String> answers;
  bool isPerson;

  Result({this.answers, this.isPerson});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      answers: json['answers'],
      isPerson: json['isPerson'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = "[${this.answers.join(',')}]";
    data['isPerson'] = "${this.isPerson}";
    return data;
  }
}

class Dog_ResultLoadingPage extends StatefulWidget {
  final Result result;
  final regist.RegiCom regiData;
  Dog_ResultLoadingPage({@required this.result, this.regiData});

  @override
  _Dog_ResultLoadingPageState createState() => _Dog_ResultLoadingPageState();
}

class _Dog_ResultLoadingPageState extends State<Dog_ResultLoadingPage> {
  MbtiResult _mbtiResult;

  @override
  void initState() {
    // 통신 기능
    loadMbtiResult(widget.result);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main.themeColor,
      body: Center(
        child: WavyAnimatedTextKit(
          text: ['Loading...'],
          speed: Duration(milliseconds: 150),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          repeatForever: false,
          totalRepeatCount: 2,
          onFinished: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Dog_ResultPage(
                  mbtiName: _mbtiResult.character,
                  isPerson: widget.result.isPerson,
                  isInfo: false,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // mbti 결과값 받기
  loadMbtiResult(Result answer) async {
    var response;

    var data = answer.toJson();

    if (answer.isPerson) {
      // 사람일때(헤더 포함해서 보내기)
      response = await http.post('${main.address}/api/mbti/result/',
          body: data,
          headers: <String, String>{
            "Authorization": "Token ${main.myNow.token}"
          });
    } else {
      // 사람이 아닐때
      response = await http.post(
        '${main.address}/api/mbti/result/',
        body: data,
      );
    }

    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        _mbtiResult = MbtiResult.fromJson(jsonData);
      });
    } else {
      throw Exception('Faild to load Get');
    }
  }
}

class MbtiResult {
  int id;
  String character;
  String url;
  String comment;
  String partner_type;

  MbtiResult({
    this.id,
    this.character,
    this.url,
    this.comment,
    this.partner_type,
  });

  factory MbtiResult.fromJson(Map<String, dynamic> json) {
    return MbtiResult(
      id: json['id'],
      character: json['character'],
      url: json['url'],
      comment: json['comment'],
      partner_type: json['partner_type'],
    );
  }
}

class Dog_ResultPage extends StatefulWidget {
  final String mbtiName;
  final bool isInfo;
  final bool isPerson;
  final regist.RegiCom regiData;

  Dog_ResultPage(
      {@required this.mbtiName, this.isInfo, this.isPerson, this.regiData});

  @override
  _Dog_ResultPageState createState() => _Dog_ResultPageState();
}

class _Dog_ResultPageState extends State<Dog_ResultPage> {
  MbtiResult _mbtiResult;
  bool _isLoading = true;

  @override
  initState() {
    loadMbtiResult(widget.mbtiName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: sp_appBar(context),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            ))
          : Column(
              children: [
                Expanded(
                  flex: 5,
                  child: sp_topStack(),
                ),
                Expanded(
                  flex: 10,
                  child: sp_whiteBox(context),
                ),
              ],
            ),
    );
  }

  // 이름으로 받아서 조회하는 기능 넣기
  // mbti 결과값 받기
  loadMbtiResult(String mbtiName) async {
    var response;

    response = await http.get('${main.address}/api/mbti/detail/$mbtiName/');

    if (response.statusCode == 200) {
      var jsonData = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        _mbtiResult = MbtiResult.fromJson(jsonData);
        _isLoading = false;
      });
    } else {
      throw Exception('Faild to load Get');
    }
  }

  sp_appBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.home,
          size: 35,
          color: main.themeColor,
        ),
        onPressed: () {
          // 메인페이지로 넘어가는 코드
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: MainPage1(),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
      ),
    );
  }

  sp_topStack() {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          // 이미지
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  '${_mbtiResult.url}',
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sp_whiteBox(context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 20),
          // Keyword

          // About you
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 15,
                        width: 200,
                        color: Colors.yellow,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '${_mbtiResult.character}',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 15,
                            ),
                            Container(
                              child: Text(
                                'type',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.circle,
                        color: main.themeColor,
                        size: 15,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'About',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 5.0),
                    child: Text(
                      '${_mbtiResult.comment}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),

          widget.isInfo
              ? Spacer()
              : Expanded(
                  // Btns
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          height: 60,
                          minWidth: 330,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),

                            // 클릭 컬러
                            color: main.themeColor,

                            child: Text(
                              "Registration",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              // Post 통신

                              // Dog Detail로
                              Navigator.push(
                                context,
                                PageTransition(
                                  // child: DogListPage(),
                                  child: spec.specpage(postID: _mbtiResult.id),
                                  type: PageTransitionType.bottomToTop,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        ButtonTheme(
                          height: 60,
                          minWidth: 330,
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: main.themeColor,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),

                            // 클릭 컬러
                            highlightColor: main.themeColor,
                            highlightedBorderColor: main.themeColor,
                            splashColor: main.themeColor,

                            child: Text(
                              "Try again",
                              style: TextStyle(
                                color: main.themeColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              // 다시 검사페이지로
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  child: Dog_MbtiTestPage_Start(
                                    isPerson: true,
                                    regiData: widget.regiData,
                                  ),
                                  type: PageTransitionType.leftToRight,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
