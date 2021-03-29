import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uhangga/main.dart' as main;
import 'package:http/http.dart' as http;
import 'package:uhangga/page_mainnew.dart';
import 'dart:io';
import '../mbti_test_pages/page_p_test.dart';

RegiCom regicomdata = RegiCom();

class DogRegiPage extends StatefulWidget {
  @override
  _DogRegPageState createState() => _DogRegPageState();
}

enum Vaccinations { Yes, No }

class _DogRegPageState extends State<DogRegiPage> {
  bool isGirl = false;
  bool isBoy = false;
  var _firebaseStorage = FirebaseStorage.instance;
  String _posteddogImageURL = '';

  Vaccinations _vaccinations = Vaccinations.No;

  // ignore: non_constant_identifier_names
  final name_Controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final age_Controller = TextEditingController();
  // ignore: non_constant_identifier_names
  // final species_Controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final breed_Controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final comment_Controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final pageView_controller = new PageController();

  File _image;

  @override
  void dispose() {
    super.dispose();
    name_Controller.dispose();
    age_Controller.dispose();
    // species_Controller.dispose();
    breed_Controller.dispose();
    comment_Controller.dispose();
  }

  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext) {
    return Scaffold(
      appBar: sp_appBar(context),
      body: Column(
        children: [
          Expanded(child: sp_InputList()),
        ],
      ),
    );
  }

  // 이미지 가져오기
  void _uploadImageToStorage(ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);

    if (image == null) return;
    setState(() {
      _image = image;
    });

    StorageReference storageReference =
        _firebaseStorage.ref().child("posted_dog/${DateTime.now().toString()}");
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);
    await storageUploadTask.onComplete;
    String downloadURL = await storageReference.getDownloadURL();

    setState(() {
      _posteddogImageURL = downloadURL;
    });
  }

  // 이미지 있는 곳 위젯
  // ignore: non_constant_identifier_names
  sp_photo() {
    return ButtonTheme(
      height: 250,
      minWidth: 500,
      // ignore: deprecated_member_use
      child: FlatButton(
          color: _image == null ? main.themeColor : Colors.white,
          child: _image == null
              ? Icon(
                  Icons.photo_camera,
                  color: Color(0x77ffffff),
                  size: 40,
                )
              : Image.network(_posteddogImageURL),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Choose your image source'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _uploadImageToStorage(ImageSource.camera);
                          },
                          child: Text('Camera')),
                      TextButton(
                          onPressed: () {
                            _uploadImageToStorage(ImageSource.gallery);
                          },
                          child: Text('Gallery'))
                    ],
                  );
                });
          }),
    );
  }

  // ignore: non_constant_identifier_names
  sp_InputList() {
    // ignore: non_constant_identifier_names
    sp_flatBtn(sex) {
      return ButtonTheme(
        height: 80,
        // ignore: deprecated_member_use
        child: FlatButton(
          // 테두리
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),

          // 클릭 컬러
          color: main.themeColor,
          highlightColor: main.themeColor,
          splashColor: main.themeColor,

          child: Center(
            child: Text(
              sex,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          onPressed: () {
            if (sex == 'Girl') {
              setState(() {
                isGirl = false;
                isBoy = true;
              });
            } else if (sex == 'Boy') {
              setState(() {
                isGirl = true;
                isBoy = false;
              });
            }
          },
        ),
      );
    }

    sp_outBtn(sex) {
      return ButtonTheme(
        height: 80,
        // ignore: deprecated_member_use
        child: OutlineButton(
          // 테두리
          borderSide: BorderSide(
            color: main.themeColor,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),

          // 클릭 컬러
          highlightColor: main.themeColor,
          highlightedBorderColor: main.themeColor,
          splashColor: main.themeColor,

          child: Center(
            child: Text(
              sex,
              style: TextStyle(
                color: main.themeColor,
                fontSize: 25,
              ),
            ),
          ),
          onPressed: () {
            if (sex == 'Girl') {
              setState(() {
                isGirl = true;
                isBoy = false;
              });
            } else if (sex == 'Boy') {
              setState(() {
                isGirl = false;
                isBoy = true;
              });
            }
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: ListView(
        children: [
          sp_photo(),
          SizedBox(height: 35),
          // name
          SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(width: 20),
                SizedBox(
                  width: 80,
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
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: const Color(0xffCECECE),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          // age
          SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(width: 20),
                SizedBox(
                  width: 80,
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
                      fillColor: const Color(0xffCECECE),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          // sex
          SizedBox(
            child: Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: isGirl ? sp_flatBtn('Girl') : sp_outBtn('Girl'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: isBoy ? sp_flatBtn('Boy') : sp_outBtn('Boy'),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          // species (grid view)
          // Container(
          //   height: 50,
          //   child: Row(
          //     children: [
          //       SizedBox(width: 20),
          //       Expanded(
          //         child: GridView.count(
          //           scrollDirection: Axis.horizontal,
          //           crossAxisCount: 1,
          //           children: <Widget>[],
          //         ),
          //       ),
          //       SizedBox(width: 20),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 50,
          //   child: Row(
          //     children: [
          //       SizedBox(width: 20),
          //       SizedBox(
          //         width: 80,
          //         child: Text(
          //           'species',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //       ),
          //       Expanded(
          //         child: TextField(
          //           controller: species_Controller,
          //           decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(30),
          //             ),
          //             filled: true,
          //             fillColor: const Color(0xffCECECE),
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 20),
          //     ],
          //   ),
          // ),
          SizedBox(height: 20),
          // breed
          SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(width: 20),
                SizedBox(
                  width: 80,
                  child: Text(
                    'breed',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: breed_Controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: const Color(0xffCECECE)),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          // vavinamtions(Yes or No)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Did it get vaccinations?',
                style: TextStyle(
                  wordSpacing: -1,
                  fontSize: 20,
                ),
              ),
              Radio(
                activeColor: main.themeColor,
                value: Vaccinations.Yes,
                groupValue: _vaccinations,
                onChanged: (value) {
                  setState(() {
                    _vaccinations = value;
                  });
                },
              ),
              Text(
                'Yes',
                style: TextStyle(fontSize: 20, color: main.themeColor),
              ),
              Radio(
                activeColor: main.themeColor,
                value: Vaccinations.No,
                groupValue: _vaccinations,
                onChanged: (value) {
                  setState(() {
                    _vaccinations = value;
                  });
                },
              ),
              Text(
                'No',
                style: TextStyle(fontSize: 20, color: main.themeColor),
              ),
            ],
          ),
          // 추가 설명란
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              controller: comment_Controller,
              decoration: InputDecoration(
                labelText: 'Comment',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          // Next Btn
          Container(
            height: 80,
            color: main.themeColor,
            // ignore: deprecated_member_use
            child: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              onPressed: () {
                // 성격검사 페이지로
                // 통신 gogo
                regicom(
                    regicomdata.photo,
                    regicomdata.name,
                    regicomdata.dogtype,
                    regicomdata.age,
                    regicomdata.comment,
                    regicomdata.area,
                    regicomdata.gender,
                    regicomdata.vaccination,
                    regicomdata.dogCharacter,
                    regicomdata.fee);
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: MbtiTestPage_Start(
                      isPerson: false,
                    ),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
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
            child: MainPage1(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
    ),
  );
}

class RegiCom {
  // 통신 클래스 선언
  List<dynamic> photo;
  String name;
  String dogtype;
  int age;
  String comment;
  String area;
  bool gender;
  bool vaccination;
  String dogCharacter;
  int fee;

  RegiCom(
      {this.photo,
      this.name,
      this.dogtype,
      this.age,
      this.comment,
      this.area,
      this.gender,
      this.vaccination,
      this.dogCharacter,
      this.fee});

  factory RegiCom.fromJson(Map<String, dynamic> json) {
    return RegiCom(
        photo: json['photo'],
        name: json['name'],
        dogtype: json['dogtype'],
        age: json['age'],
        comment: json['comment'],
        area: json['area'],
        gender: json['gender'],
        vaccination: json['vaccination'],
        dogCharacter: json['dogCharacter'],
        fee: json['fee']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['photo'] = "[${this.photo.join(',')}]";
    return data1;
  }
}

regicom(
  photo,
  name,
  dogtype,
  age,
  comment,
  area,
  gender,
  vaccination,
  dogCharacter,
  fee,
) async {
  Map dog_data = {
    'photo': photo,
    'name': name,
    'dogtype': dogtype,
    'age': age,
    'comment': comment,
    'area': area,
    'gender': gender,
    'vaccination': vaccination,
    'dogCharacter': dogCharacter,
    'fee': fee
  };

  var jsonData = null;
  var response = await http.post('${main.address}/api/dog/post/',
      body: dog_data,
      headers: <String, String>{"Authorization": "Token ${main.myNow.token}"});

  if (response.statusCode == 200) {
    jsonData = json.decode(response.body);
  } else {
    throw Exception('Register Failed!');
  }
}
