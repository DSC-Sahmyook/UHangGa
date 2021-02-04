import 'package:flutter/material.dart';
import 'main.dart';
import 'main.dart';
import 'page_main.dart';

import 'package:percent_indicator/percent_indicator.dart';

class MbtiTestPage_Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              // 뒤로가기 버튼
              SizedBox(height: 20),
              sp_BackIcon(context, 'home'),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 강아지 그림
                    sp_Image(),
                    // Text
                    SizedBox(height: 20),
                    sp_Text(),
                    // 스타트 버튼
                    SizedBox(height: 70),
                    sp_StartBtn(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 뒤로가기 버튼
sp_BackIcon(context, target) {
  return Row(
    children: [
      IconButton(
        icon: Icon(Icons.arrow_back),
        iconSize: 35,
        color: Color(0xffe06b2e),
        onPressed: () {
          if (target == 'pop') {
            Navigator.pop(context);
          } else if (target == 'home') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => target()),
            );
          }
        },
      )
    ],
  );
}

sp_BlankIcon() {
  return Row(
    children: [
      Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 51,
      )
    ],
  );
}

// 강아지 그림
sp_Image() {
  return Image.asset('lib/assets/pics/pic2.png');
}

// 텍스트
sp_Text() {
  return Column(
    children: [
      Text(
        "Who is \nmy best dog?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
      SizedBox(height: 20),
      Text(
        "Let's find a dog that fits you well.",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
      ),
    ],
  );
}

// 스타트버튼
sp_StartBtn(context) {
  return ButtonTheme(
    minWidth: 300.0,
    height: 50.0,
    child: RaisedButton(
      color: themeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Text(
        'START',
        style: TextStyle(
          letterSpacing: 3,
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MbtiTestPage_Ing()),
        );
      },
    ),
  );
}

class MbtiTestPage_Ing extends StatelessWidget {
  bool isFirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // 뒤로가기 버튼
            SizedBox(height: 20),
            // sp_BackIcon(context, 'pop'),
            isFirst ? sp_BlankIcon() : sp_BackIcon(context, 'pop'),
            // Question Text
            Expanded(
              child: Center(
                child: sp_Question(0),
              ),
            ),

            // Button
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sp_Btn(0, 'A'),
                  SizedBox(height: 20),
                  sp_Btn(0, 'B'),
                ],
              ),
            ),

            // ProgressBar
            sp_ProgressBar(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

List<String> Q_item = ['When I take a walk \nwith my partner'];
List<String> A_item = ['I Love my partner_A'];
List<String> As_item = ['the puppy is too scared_A'];
List<String> B_item = ['I Love my partner_B'];
List<String> Bs_item = ['the puppy is too scared_B'];

// Question Text
sp_Question(index) {
  return Text(
    Q_item[index],
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
  );
}

// Button
sp_Btn(index, choice) {
  List<Widget> textItem;
  TextStyle title = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  TextStyle subtitle = TextStyle(
    fontSize: 15,
    color: Colors.grey,
  );

  if (choice == 'A') {
    textItem = [
      Text(
        A_item[index],
        style: title,
      ),
      Text(
        As_item[index],
        style: subtitle,
      )
    ];
  } else if (choice == 'B') {
    textItem = [
      Text(
        B_item[index],
        style: title,
      ),
      Text(
        Bs_item[index],
        style: subtitle,
      )
    ];
  }

  return ButtonTheme(
    height: 100,
    minWidth: 350,
    child: OutlineButton(
      // 테두리
      borderSide: BorderSide(color: themeColor, width: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      // 클릭 컬러
      highlightColor: themeColor,
      highlightedBorderColor: themeColor,
      splashColor: themeColor,

      child: Column(
        children: textItem,
      ),
      onPressed: () {
        // 다음껄로 넘어가기
      },
    ),
  );
}

// ProgressBar
sp_ProgressBar() {
  return LinearPercentIndicator(
    lineHeight: 10,
    percent: 0.1, // 퍼센트 계산하기
    backgroundColor: Color(0xffF9D7C5),
    progressColor: themeColor,
  );
}
