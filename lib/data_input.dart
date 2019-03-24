import 'package:flutter/material.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {

  FocusNode nameField = FocusNode();
  FocusNode contextField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Input"),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/Debt-Burden.png'),
        //   ),
        // ),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Text("Enter Udhari"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: null,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixText: '₹ ',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Amount',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: null,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: null,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Context',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {},
        tooltip: 'Done',
      ),
    );
  }
}
