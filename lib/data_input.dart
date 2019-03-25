import 'package:flutter/material.dart';
import 'Udhari.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  FocusNode nameField = FocusNode();
  FocusNode contextField = FocusNode();
  var _radioButtonVal = -1;
  DateTime now;

  UdhariClass udhariData = new UdhariClass();

  @override
  Widget build(BuildContext context) {
    Widget radioButtonBuilder(int _setValue, String _label) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Radio(
            value: _setValue,
            groupValue: _radioButtonVal,
            onChanged: (_) {
              setState(() {
                _radioButtonVal = _setValue;
                if (_radioButtonVal == 1)
                  print("User selected Borrow");
                else if (_radioButtonVal == 2) print("User selected Lend");
              });
            },
          ),
          Text("$_label"),
          SizedBox(
            width: 15,
          ),
        ],
      );
    }

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text("Enter Udhari"),
              ),
              //radio buttons############################################################
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      radioButtonBuilder(1, "Borrowed"),
                      radioButtonBuilder(2, "Lend"),
                    ],
                  )),
              //amount field############################################################
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  textInputAction: TextInputAction.next,
                  onChanged: (newAmount) {
                    FocusScope.of(context).requestFocus(nameField);
                    udhariData.amount = newAmount;
                    print("Amount: $newAmount");
                  },
                  decoration: InputDecoration(
                    prefixText: '₹ ',
                    labelText: 'Amount',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              //name field############################################################
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: TextField(
                  autocorrect: true,
                  focusNode: nameField,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  onChanged: (newName) {
                    FocusScope.of(context).requestFocus(contextField);
                    udhariData.name = newName;
                    print("Name: $newName");
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              //context field############################################################
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: TextField(
                  autocorrect: true,
                  focusNode: contextField,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  onChanged: (newContext) {
                    udhariData.context = newContext;
                    print("Context: $newContext");
                  },
                  decoration: InputDecoration(
                    labelText: 'Context',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          udhariData.date = DateTime.now().toLocal().toString();
          udhariData.pushToFirebase();
          Navigator.pop(context);
        },
        tooltip: 'Done',
      ),
    );
  }
}
