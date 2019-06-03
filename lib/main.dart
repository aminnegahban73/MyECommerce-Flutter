import 'package:flutter/material.dart';
import 'package:my_shop/pages/login_page.dart';
import 'package:my_shop/pages/splash_screen_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(   
        primaryColor: Colors.red,
      ),
      home: SpalshScreenPage(),
    ));
