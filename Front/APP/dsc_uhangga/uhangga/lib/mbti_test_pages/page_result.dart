import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart' as main;
import '../page_mainnew.dart';
import 'page_p_test.dart';
import '../Dog_Registration_page/page_dog_list.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class Result {
  List<String> answer;
  bool isperson;

  Result({this.answer, this.isperson});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      answer: json['answer'],
      isperson: json['isperson'],
    );
  }
}

bool isLoading = true;

class ResultLoadingPage extends StatelessWidget {
  final Result result;
  ResultLoadingPage({@required this.result});

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
                child: ResultPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: main.themeColor,
      appBar: sp_appBar(context),
      body: Column(
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
}

sp_appBar(context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.home,
        size: 35,
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
              Expanded(
                child: Image.asset('lib/assets/pics/enfp.png'),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
        // Text
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                "You are",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Text(
                "Devoted Theresa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Best partner is Birthday prince',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
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
        Expanded(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.circle,
                    color: main.themeColor,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Keyword',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Image.asset(
                'lib/assets/pics/emotion.png',
                height: 90,
              ),
            ],
          ),
        ),
        // About you
        Expanded(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.circle,
                      color: main.themeColor,
                      size: 15,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'About you',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
                  child: Text(
                    'He is a puppy who gets along well with children and is kind to strangers. I feel happy in my relationship with my pet and I have a lot of reactions. If your companion is busy, you may have to sulk and soothe him!',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Btns
        Expanded(
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
                      // Dogs List로
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DogListPage(),
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
                          child: MbtiTestPage_Start(),
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

class TestCom {
  List<String> answer = [];
  bool isperson;

  TestCom({this.answer, this.isperson});
}

testcom(answer, isperson) async {
  Map data = {'answer': answer, 'isperson': isperson};

  print(data);

  var jsonData = null;
  var response =
      await http.post('${main.address}/api/mbti/result/', body: data);

  if (response.statusCode == 200) {
    jsonData = json.decode(response.body);
  } else {
    throw Exception('Something went wrong... Test Fail');
  }
}
