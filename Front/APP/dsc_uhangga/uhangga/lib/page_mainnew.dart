import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uhangga/Dog_Registration_page/page_dog_Registration.dart';
import 'package:uhangga/Dog_Registration_page/page_dog_list.dart';
import 'package:uhangga/com.dart';
import 'package:uhangga/mbti_test_pages/page_result.dart';
import 'package:uhangga/page_login.dart';
import 'package:uhangga/page_specific.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://news.seoul.go.kr/welfare/archives/521135';

@JsonSerializable()
class MainPage1 extends StatefulWidget {
  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: true,
          expandedHeight: 350,
          flexibleSpace: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'lib/assets/pics/pic3.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Text(
                  'Your partner',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                top: 250,
                left: 15,
              ),
              Positioned(
                child: Text(
                  'Devoted Theresa',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                ),
                top: 270,
                left: 15,
              ),
              Positioned(
                child: InkWell(
                  child: Text(
                    'looking close →',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => ResultPage()));
                  },
                ),
                top: 315,
                left: 15,
              )
            ],
          ),
          elevation: 0,
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: const Color(0xffD75B2A)),
                child: Container(
                  height: 500,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                      color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          "NICKNAME",
                          style: TextStyle(
                              color: const Color(0xff707070),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, right: 15),
                        child: InkWell(
                          child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/pics/List2.png'),
                                      fit: BoxFit.cover))),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 8, right: 16),
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: const Color(0xff9F9F9F)),
                            height: 200,
                            width: 380,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 230,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff9F9F9F)),
                                  height: 200,
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 35,
                                      ),
                                      Container(
                                        child: Text(
                                          '58',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'puppies waiting',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Container(
                                        height: 8,
                                      ),
                                      Container(
                                        child: Text(
                                          '80%',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'adoption rate',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.white),
                            height: 200,
                            width: 195,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: const Color(0xffe06b2e)),
                            height: 200,
                            width: 185,
                            child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => DogRegiPage()));
                                },
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 120,
                                        child: Image.asset(
                                            'lib/assets/pics/pic1.png'),
                                      ),
                                      Container(
                                        child: Text(
                                          'Temporary protection',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          'Dog Registration',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'looking for my family',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff707070)),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            child: Text(
                              'more →',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => DogListPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.network(
                                'https://i.guim.co.uk/img/media/fe1e34da640c5c56ed16f76ce6f994fa9343d09d/0_174_3408_2046/master/3408.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=0d3f33fb6aa6e0154b7713a00454c83d',
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => specpage()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                  ),
                  InkWell(
                    child: Image.asset(
                      'lib/assets/pics/banner.png',
                      fit: BoxFit.cover,
                    ),
                    onTap: _launchURL,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }

  _launchURL() async {
    await launch(url, forceWebView: true, forceSafariVC: true);
  }
}
