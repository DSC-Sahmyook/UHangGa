import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/main.dart' as main;
import 'package:uhangga/page_specific.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ListData {
  int id;
  String photoUrl;
  String name;
  String address;
  String breed;
  int age;

  ListData(
      {this.id, this.photoUrl, this.name, this.address, this.breed, this.age});

  factory ListData.fromJson(Map<String, dynamic> json) {
    return ListData(
        id: json['id'],
        photoUrl: json['photoUrl'],
        name: json['name'],
        address: json['address'],
        breed: json['dogType'],
        age: json['age']);
  }
}

class DogListPage extends StatefulWidget {
  String mypartnerTypeName;
  DogListPage({@required this.mypartnerTypeName});

  @override
  _DogListPageState createState() => _DogListPageState();
}

class _DogListPageState extends State<DogListPage> {
  bool _isLoading = true; // 로딩중이야?
  bool _isFilteredBreed = false; // 견종 필터링한대?
  bool _isRecomended = false; // 추천 받는대?
  final TextEditingController _breedTextController = TextEditingController();

  List<ListData> nowList = [];

  _loadList(String breed, String type) async {
    var response = await http.get('${main.address}/api/posts/$breed/$type');

    if (response.statusCode == 200) {
      nowList.clear();
      for (var i in json.decode(response.body))
        nowList.add(ListData.fromJson(i));

      setState(() {
        _isLoading = false;
      });
    } else {
      throw Exception('Something went wrong... - Dogs List Get Fail');
    }
  }

  @override
  initState() {
    if (widget.mypartnerTypeName == "Check Your Type!") {
      _loadList("None", "None");
    } else {
      _loadList("None", widget.mypartnerTypeName);
      _isRecomended = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: sp_appBar(context),
      body: Column(
        children: <Widget>[
          // 필터링
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 견종 검색
                  Expanded(child: sp_filterText()),
                  // 추천 받을지 선택
                  Expanded(child: sp_filterBtn()),
                ],
              ),
            ),
          ),
          // 리스트
          Expanded(
            flex: 9,
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(main.themeColor),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 15,
                      right: 15,
                    ),
                    child: ListView.builder(
                        itemCount: nowList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return sp_dogItems(
                              context,
                              nowList[index].id,
                              nowList[index].name,
                              nowList[index].photoUrl,
                              nowList[index].address,
                              nowList[index].breed,
                              nowList[index].age);
                        }),
                  ),
          ),
        ],
      ),
    );
  }

  // 견종 필터링 텍스트
  sp_filterText() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[300],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: TextFormField(
                  controller: _breedTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hasFloatingPlaceholder: false,
                    labelText: "breed",
                    labelStyle: TextStyle(fontSize: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // 필터링
                    // 텍스트가 비었는지 안비었는지 확인
                    // 비었으면, None으로 탐색
                    // 안비었으면, 그 값으로 탐색
                    setState(() {
                      _isLoading = true;
                      if (_breedTextController.text == "") {
                        _isFilteredBreed = false;
                        if (_isRecomended) {
                          _loadList("None", widget.mypartnerTypeName);
                        } else {
                          _loadList("None", "None");
                        }
                      } else {
                        _isFilteredBreed = true;
                        if (_isRecomended) {
                          _loadList(_breedTextController.text,
                              widget.mypartnerTypeName);
                        } else {
                          _loadList(_breedTextController.text, "None");
                        }
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 추천 필터링 버튼
  sp_filterBtn() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: _isRecomended ? main.themeColor : Colors.grey[300]),
              child: Text(
                "Recomend",
                style: TextStyle(
                    color: _isRecomended ? Colors.white : Colors.grey),
              ),
              onPressed: () {
                if (_isRecomended == false &&
                    widget.mypartnerTypeName != "Check Your Type!") {
                  setState(() {
                    _isRecomended = !_isRecomended;
                    _isLoading = true;

                    if (_isFilteredBreed) {
                      _loadList(
                          _breedTextController.text, widget.mypartnerTypeName);
                    } else {
                      _loadList("None", widget.mypartnerTypeName);
                    }
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: _isRecomended ? Colors.grey[300] : main.themeColor),
              child: Text(
                "See All",
                style: TextStyle(
                    color: _isRecomended ? Colors.grey : Colors.white),
              ),
              onPressed: () {
                if (_isRecomended == true) {
                  setState(() {
                    _isRecomended = !_isRecomended;
                    _isLoading = true;

                    if (_isFilteredBreed) {
                      _loadList(_breedTextController.text, "None");
                    } else {
                      _loadList("None", "None");
                    }
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

sp_appBar(context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Image.asset(
      "lib/assets/pics/logo2.png",
      width: 55,
    ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: main.themeColor,
        size: 30,
      ),
      onPressed: () {
        // 메인페이지로 넘어가는 코드
        Navigator.pop(context);
      },
    ),
  );
}

sp_dogItems(context, int id, String name, String photoUrl, String address,
    String breed, int age) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 2,
    child: InkWell(
      child: Container(
        height: 130,
        child: Row(
          children: [
            SizedBox(width: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(photoUrl),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: main.themeColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'RECRUIT',
                          style:
                              TextStyle(fontSize: 12, color: main.themeColor),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.cyan,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'GOOD',
                          style: TextStyle(fontSize: 12, color: Colors.cyan),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$name',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$address\n$breed, $age months',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      splashColor: main.themeColor,
      highlightColor: main.themeColor,
      onTap: () {
        // 디테일 페이지로
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => specpage(
              postID: id,
            ),
          ),
        );
      },
    ),
  );
}
