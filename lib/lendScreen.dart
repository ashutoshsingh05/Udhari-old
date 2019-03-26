import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Lend extends StatefulWidget {
  @override
  _LendState createState() => _LendState();
}

class _LendState extends State<Lend> {
  var myDatabase = Firestore.instance
      .collection('Users')
      .document('912bb235e52b3196')
      .collection('lend');

  Widget _lendCardsBuilder(
      String receipent, String lendContext, int amount, String dateLend) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.tag_faces,
              color: Colors.red,
            ),
            title: Text("$receipent"),
            subtitle: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,8,0,1),
                  ),
                  Text("$lendContext"),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,8,0,1),
                  ),
                  Text("$dateLend"),
                ],
              ),
            ),
            trailing: SizedBox(
              child: Text('₹$amount'),
              width: 50,
            ),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text("Edit"),
                  onPressed: () {},
                ),
                FlatButton(
                  child: const Text('Mark as paid'),
                  onPressed: () {
                    myDatabase.document('$receipent').delete().then((_) {
                      print("Document $receipent has been deleted");
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: myDatabase.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            if (!snapshot.hasData) return Text('No data found!');
            return Container(
              // margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                  return _lendCardsBuilder(
                      "${document['Name']}",
                      "${document['Context']}",
                      document['Amount'],
                      "${document['Date']}");
                }).toList()),
              ),
            );
        }
      },
    );
  }
}
