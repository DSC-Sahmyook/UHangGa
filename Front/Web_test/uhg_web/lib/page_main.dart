import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:uhangga/Dog_Registration_page/page_dog_Registration.dart';
// import 'package:uhangga/page_login.dart';

class MainPage1 extends StatefulWidget {
  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  @override
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
                  'Popular Youtuber',
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
                    // Navigator.push(context,
                    //     CupertinoPageRoute(builder: (context) => LoginPage()));
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
                            // Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //         builder: (context) => LoginPage()));
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
                                  // Navigator.push(
                                  //     context,
                                  //     CupertinoPageRoute(
                                  //         builder: (context) => DogRegiPage()));
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
                            onTap: () {},
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
                              child: Image.asset(
                                'lib/assets/pics/List1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.asset(
                                'lib/assets/pics/List3.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.asset(
                                'lib/assets/pics/List4.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.asset(
                                'lib/assets/pics/List5.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 15,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: InkWell(
                              child: Image.asset(
                                'lib/assets/pics/List6.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                  ),
                  Container(
                      width: double.maxFinite,
                      child: Image.asset(
                        'lib/assets/pics/banner.png',
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
