import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/main.dart';
import 'package:uhangga/page_specific.dart';

class DogListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sp_appBar(context),
      body: Column(
        children: <Widget>[
          // 검색창
          // 종 검색 버튼
          // 리스트
          Expanded(
            child: ListView(
              children: [
                sp_dogItems(context),
                sp_dogItems(context),
                sp_dogItems(context),
                sp_dogItems(context),
                sp_dogItems(context),
                sp_dogItems(context),
              ],
            ),
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
        Icons.arrow_back,
        size: 35,
      ),
      onPressed: () {
        // 메인페이지로 넘어가는 코드
        // Navigator.pop(context);
      },
    ),
  );
}

sp_dogItems(context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 2,
    child: InkWell(
      child: Container(
        height: 130,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
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
                            color: themeColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'RECRUIT',
                          style: TextStyle(fontSize: 12, color: themeColor),
                        ),
                      ),
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
                    'Max',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Nowon-gu, Seoul\nPug, two months',
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
      splashColor: themeColor,
      highlightColor: themeColor,
      onTap: () {
        // 디테일 페이지로
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => specpage(
                      postID: 2,
                    )));
      },
    ),
  );
}
