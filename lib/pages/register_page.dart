import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String _fullName;
  String _email;
  String _password;
  String _confirmPassword;
  String url = 'http://192.168.56.1:8080/ecommerce/userRegister.php';

  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool autoValidate = false;

  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();

  Future<List> _register() async {
    final response = await http.post(url, body: {
      'fullname': _fullName,
      'user_email': _email,
      'user_password': _password,
      'user_role': 'admin',
    });
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
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Form(
                  key: _formKey,
                  autovalidate: autoValidate,
                  child: formUI(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget formUI() {
    return Column(
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
                  labelText: 'Full Name',
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _fullNameController,
                validator: validateName,
                onSaved: (String value) => _fullName = value,
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
                  labelText: 'Email',
                  icon: Icon(Icons.alternate_email),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: validateEmail,
                onSaved: (String value) => _email = value,

                // (value) {
                //   if (value.isEmpty) {
                //     Pattern pattern =
                //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //     RegExp regExp = new RegExp(pattern);
                //     if (regExp.hasMatch(value))
                //       return '.لطفا ایمیل صحیح وارد کنید';
                //     else
                //       return null;
                //   }
                // },
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
              child: ListTile(
                title: TextFormField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String value) => _password = value,
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
                trailing: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      if (hidePassword)
                        hidePassword = false;
                      else
                        hidePassword = true;
                    });
                  },
                ),
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
              child: ListTile(
                title: TextFormField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Confirm Password',
                    icon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String value) => _confirmPassword = value,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '.لطفا رمز را وارد کنید';
                    } else if (value.length < 6) {
                      return 'طول رمز بیشتر از 6 کاراکتر';
                    } else if (_passwordController.text != value) {
                      return 'Password doesnt matched';
                    }
                    return null;
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      if (hideConfirmPassword)
                        hideConfirmPassword = false;
                      else
                        hideConfirmPassword = true;
                    });
                  },
                ),
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
                _validateInputsAndSubmit();
              },
              minWidth: MediaQuery.of(context).size.width,
              child: Text(
                'Register',
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
          padding: EdgeInsets.only(top: 20.0, bottom: 20),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )),
        ),
      ],
    );
  }

  void _validateInputsAndSubmit() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      _register();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        autoValidate = true;
      });
    }
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
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
