import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 350,
                color: const Color(0xffe06b2e),
              ),
              Container(
                height: 25,
              ),
              Text(
                "NICKNAME",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ),
    );
  }
}
