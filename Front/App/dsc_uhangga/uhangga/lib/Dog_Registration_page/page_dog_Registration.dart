import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uhangga/main.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../page_main.dart';

class DogRegiPage extends StatefulWidget {
  @override
  _DogRegPageState createState() => _DogRegPageState();
}

final name_Controller = TextEditingController();
final age_Controller = TextEditingController();
final breed_Controller = TextEditingController();
final comment_Controller = TextEditingController();

class _DogRegPageState extends State<DogRegiPage> {
  final pageView_controller = new PageController();

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: sp_appBar(context),
      body: Column(
        children: [
          Expanded(flex: 5, child: sp_photo()),
          Expanded(flex: 10, child: sp_InputList()),
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
        Icons.arrow_back,
        size: 35,
      ),
      onPressed: () {
        // 메인페이지로 넘어가는 코드
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: MainPage(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
    ),
  );
}

sp_photo() {
  return ButtonTheme(
    minWidth: 500,
    child: FlatButton(
      color: themeColor,
      child: Icon(
        Icons.photo_camera,
        color: Color(0x77ffffff),
        size: 40,
      ),
      onPressed: () {
        // 이미지 피커
      },
    ),
  );
}

sp_InputList() {
  bool isGirl = false;
  bool isBoy = false;

  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: ListView(
      children: [
        SizedBox(height: 30),
        // name
        Row(
          children: [
            SizedBox(width: 20),
            SizedBox(
              width: 70,
              child: Text(
                'name',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: TextField(
                controller: name_Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 20),
        // age
        Row(
          children: [
            SizedBox(width: 20),
            SizedBox(
              width: 70,
              child: Text(
                'age',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: TextField(
                controller: age_Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 20),
        // sex
        Row(
          children: [
            SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: isGirl ? sp_flatBtn('girl') : sp_outBtn('girl'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: isGirl ? sp_flatBtn('boy') : sp_outBtn('boy'),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        // breed (grid view)
        // bredd
        // vavinamtions(Yes or No)
        // 추가 설명란
        // Next Btn
      ],
    ),
  );
}

sp_flatBtn(sex) {}
sp_outBtn(sex) {
  return ButtonTheme(
    height: 150,
    child: OutlineButton(
      child: Center(
        child: Icon(
          MdiIcons.humanFemale,
          size: 100,
        ),
      ),
      onPressed: () {},
    ),
  );
}

class Info {
  String name;
  String age;
  String sex;
  String species;
  String breed;
  bool vavinations;
  String comment;

  Info(
    this.name,
    this.age,
    this.sex,
    this.species,
    this.breed,
    this.vavinations,
    this.comment,
  );
}
