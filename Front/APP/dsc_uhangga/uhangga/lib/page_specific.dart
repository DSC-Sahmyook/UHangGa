import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uhangga/mbti_test_pages/page_result.dart';
import 'package:uhangga/page_mainnew.dart';

class specpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
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
                context, CupertinoPageRoute(builder: (context) => MainPage1()));
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite_outline_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {})
        ],
        flexibleSpace: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 350,
                  width: 400,
                  child: Image.asset(
                    'lib/assets/pics/pic3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 350,
                  width: 400,
                  child: Image.asset(
                    'lib/assets/pics/pic3.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 350,
                  width: 400,
                  child: Image.asset(
                    'lib/assets/pics/pic3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
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
                      'Max',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    child: Text(
                      '2020. 12. 04',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
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
                            border: Border.all(color: const Color(0xffe06b2e))),
                        child: Center(
                          child: Text(
                            'RECRUIT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 9,
                              color: const Color(0xffe06b2e),
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
                            border: Border.all(color: const Color(0xff2EE0B0))),
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
                    height: 250,
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
                              child: Text(':   Welsh Corgi',
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
                              ':   male',
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
                              ':   2 months',
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
                              ':   Yes',
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
                              ':   Free',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 275,
                  child: RaisedButton(
                    color: const Color(0xffe06b2e),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ResultPage()));
                    },
                    child: Text(
                      'Devoted Theresa type',
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
              decoration: BoxDecoration(color: const Color(0xffF1F1F1)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 80,
                    color: const Color(0xffe06b2e),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'NICKNAME',
                    style: TextStyle(
                      color: const Color(0xffe06b2e),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Icon(
                    Icons.phone_enabled_rounded,
                    size: 45,
                    color: const Color(0xffe06b2e),
                  ),
                ),
              ],
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
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit.',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          ],
        ),
      )
    ]));
  }
}
