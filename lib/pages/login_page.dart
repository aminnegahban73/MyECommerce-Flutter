import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:my_shop/pages/home_page.dart';

import 'package:my_shop/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey();

  bool autoValidate = false;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  String url = 'http://192.168.56.1:8080/ecommerce/userLogin.php';

  String fullname = '';

  Future<List> _login() async {
    final response = await http.post(url, body: {
      'user_email': _emailController.text,
      'user_password': _passwordController.text,
    });
    var userData = jsonDecode(response.body);

    if (userData.length == 0) {
      print('Login Failed');
    } else {
      if (userData[0]["user_role"] == 'admin') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      fullname: fullname,
                    )));
      } else if (userData[0]['user_role'] == 'member') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      fullname: fullname,
                    )));
      }

      setState(() {
        fullname = userData[0]['fullname'];
      });
    }
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blueGrey[800],
              Colors.blueGrey[700],
              Colors.blueGrey[600],
              Colors.blueGrey[500],
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Email',
                                icon: Icon(Icons.alternate_email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: validateEmail,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                                icon: Icon(Icons.lock),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return '.لطفا رمز را وارد کنید';
                                } else if (value.length < 6) {
                                  return 'طول رمز بیشتر از 6 کاراکتر';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red,
                          child: MaterialButton(
                            onPressed: () {
                              _login();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              'LOGIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: InkWell(
                            onTap: () {},
                            child: Text('Forgot Password',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text('Register',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
