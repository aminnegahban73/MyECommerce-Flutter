import 'package:flutter/material.dart';
import 'dart:async';

import 'package:my_shop/pages/home_page.dart';
import 'package:my_shop/pages/login_page.dart';

class SpalshScreenPage extends StatefulWidget {
  @override
  _SpalshScreenPageState createState() => _SpalshScreenPageState();
}

class _SpalshScreenPageState extends State<SpalshScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.deepOrange[800],
                  Colors.deepOrange[700],
                  Colors.deepOrange[600],
                  Colors.deepOrange[400],
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60.0,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.red,
                          size: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        'لوازم خانگی نگهبان',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'خرید آنلاین\nدر هر لحظه',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    LinearProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
