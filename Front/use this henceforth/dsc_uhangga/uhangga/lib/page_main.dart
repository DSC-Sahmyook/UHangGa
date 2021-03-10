/* import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uhangga/Dog_Registration_page/page_dog_Registration.dart';
import 'package:uhangga/page_login.dart';

final List<String> bannerImages = <String>['banner.png'];
final List<String> imagelist = <String>['List1.png'];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 275,
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
                  top: 200,
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
                  top: 230,
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
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LoginPage()));
                    },
                  ),
                  top: 270,
                  left: 15,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "NICKNAME",
                        style: TextStyle(
                            color: const Color(0xff707070),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('lib/assets/pics/List2.png'),
                                    fit: BoxFit.cover))),
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: const Color(0xff9F9F9F)),
                          height: 200,
                          width: 600,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 230,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff9F9F9F)),
                                height: 200,
                                width: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            fontSize: 16,
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
                                            fontSize: 16,
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
                          width: 220,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: const Color(0xffe06b2e)),
                          height: 200,
                          width: 205,
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
                                      child: Text(
                                        'Dog Registration',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
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
                            style: TextStyle(color: Colors.grey, fontSize: 18),
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
          )
        ],
      ),
    );
  }
}
*/
