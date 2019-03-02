import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional(0, 0),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.1),
            child: Text("New World"),
          ),
          Text("Old World"),
        ],
      ),
    );
  }
}
