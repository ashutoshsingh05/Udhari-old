import 'package:flutter/material.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {

  Widget _neverSatisfied() {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'You will never be satisfied. This call to setState tells the Flutter framework that something has changed in this State, which causes it to rerun the build method below so that the display can reflect the updated values. If we changed counter without calling setState(), then the build method would not be called again, and so nothing would appear to happen.'),
                Text(
                    'You\’re like me. I’m never satisfied. You will never be satisfied. This call to setState tells the Flutter framework that something has changed in this State, which causes it to rerun the build method below so that the display can reflect the updated values. If we changed counter without calling setState(), then the build method would not be called again, and so nothing would appear to happen'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    //return _neverSatisfied();
    return _neverSatisfied();
  }
}