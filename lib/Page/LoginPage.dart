import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:seatlect_admin/Networking/adminAPI.dart';
import 'package:seatlect_admin/Networking/businessAPI.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _textUsernameController = TextEditingController();
  final _textPasswordController = TextEditingController();

  @override
  void dispose() {
    _textUsernameController.dispose();
    _textPasswordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // var res = BusinessAPI().getBusiness(1, 1);
    // print(res);
    print("Username = " +
        _textUsernameController.text +
        " / Password = " +
        _textPasswordController.text);
    var response = AdminAPI()
        .login(_textUsernameController.text, _textPasswordController.text);
    print(response);
    // var code = response.statusCode;
    // var snackBarSuccess = SnackBar(content: Text('Status code = $code'));
    // ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
  }

  @override
  Widget build(Object context) {
    var customTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "SEATLECT for Administrator",
            style: customTextTheme.headline2,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: _textUsernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: _textPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          OutlinedButton(
            onPressed: _handleLogin,
            child: Text(
              "Login",
              style: customTextTheme.headline4,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                foregroundColor: MaterialStateProperty.all(Colors.black)),
          )
        ],
      ),
    );
  }
}
