import 'package:flutter/material.dart';
import 'package:uhangga/page_mainnew.dart';

import 'text_items.dart';
import 'page_result.dart';
import '../main.dart';

import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MbtiTestPage_Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: sp_BackIcon(context, 'home'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
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
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      iconSize: 35,
      color: Color(0xffe06b2e),
      onPressed: () {
        if (target == 'pop') {
          textCount--;
          selectAnswers.removeLast();
          Navigator.pop(context);
        } else if (target == 'home') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage1()),
          );
        }
      },
    ),
  );
}

sp_BlankIcon() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: Icon(
      Icons.arrow_back,
      color: Colors.white,
      size: 51,
    ),
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
          fontSize: 40,
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
    height: 80.0,
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

int textCount = 0;
bool isFirst = true;
List<String> selectAnswers = [];
bool isperson = true;

class MbtiTestPage_Ing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isFirst ? sp_BlankIcon() : sp_BackIcon(context, 'pop'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Question Text
            Expanded(
              child: Center(
                child: sp_Question(textCount),
              ),
            ),

            // Button
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sp_Btn(textCount, 'A', context),
                  SizedBox(height: 20),
                  sp_Btn(textCount, 'B', context),
                ],
              ),
            ),

            // ProgressBar
            sp_ProgressBar(textCount),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Question Text
sp_Question(index) {
  return Text(
    isperson ? Per_Q_item[index] : Dog_Q_item[index],
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
  );
}

// Button
sp_Btn(index, choice, context) {
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
        isperson ? Per_A_item[index] : Dog_A_item[index],
        style: title,
        textAlign: TextAlign.center,
      ),
      Text(
        isperson ? Per_As_item[index] : Dog_As_item[index],
        style: subtitle,
        textAlign: TextAlign.center,
      )
    ];
  } else if (choice == 'B') {
    textItem = [
      Text(
        isperson ? Per_B_item[index] : Dog_B_item[index],
        style: title,
        textAlign: TextAlign.center,
      ),
      Text(
        isperson ? Per_Bs_item[index] : Dog_Bs_item[index],
        style: subtitle,
        textAlign: TextAlign.center,
      )
    ];
  }

  return ButtonTheme(
    height: 130,
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
        if (choice == 'A') {
          isFirst = false;
          textCount++;
          selectAnswers.add('A');
          if (textCount >= 12) {
            isFirst = true;
            textCount = 0;
            selectAnswers = [];
            final result = Result(selectAnswers);
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: ResultLodingPage(result: result),
              ),
            );
          } else {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: MbtiTestPage_Ing(),
              ),
            );
          }
        } else if (choice == 'B') {
          isFirst = false;
          textCount++;
          selectAnswers.add('B');
          if (textCount >= 12) {
            isFirst = true;
            textCount = 0;
            selectAnswers = [];
            final result = Result(selectAnswers);
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: ResultLodingPage(result: result),
              ),
            );
          } else {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: MbtiTestPage_Ing(),
              ),
            );
          }
        }
      },
    ),
  );
}

// ProgressBar
sp_ProgressBar(textCount) {
  return LinearPercentIndicator(
    lineHeight: 10,
    percent: (textCount / 12), // 퍼센트 계산하기
    backgroundColor: Color(0xffF9D7C5),
    progressColor: themeColor,
  );
}
