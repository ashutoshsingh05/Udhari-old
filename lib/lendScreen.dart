import 'package:flutter/material.dart';

class Lend extends StatefulWidget {
  @override
  _LendState createState() => _LendState();
}

class _LendState extends State<Lend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.build),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20,top: 30),
            child: Text(
                "Sorry, we are currently building this part of the app\n\nStay Tuned..."),
          ),
        ],
      ),
    );
  }
}
