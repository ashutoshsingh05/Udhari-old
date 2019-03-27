import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:device_id/device_id.dart';

class Borrow extends StatefulWidget {
  @override
  _BorrowState createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
  String _deviceid = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    String deviceid;
    deviceid = await DeviceId.getID;
    if (!mounted) return;
    setState(
      () {
        _deviceid = deviceid;
      },
    );
  }

  Widget _borrowCardsBuilder(
      String receipent, String borrowContext, int amount, String dateBorrowed) {
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
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 1),
                  ),
                  Text("$borrowContext"),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 1),
                  ),
                  Text("$dateBorrowed"),
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
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg:
                            "Sorry! This feature is in development right now 😅",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.black12,
                        textColor: Colors.black87,
                        fontSize: 16.0);
                  },
                ),
                FlatButton(
                  child: const Text('Mark as Paid'),
                  onPressed: () {
                    Firestore.instance
                        .collection('Users')
                        .document(_deviceid)
                        .collection('borrow')
                        .document('$receipent')
                        .delete()
                        .then((_) {
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
      stream: Firestore.instance
          .collection('Users')
          .document(_deviceid)
          .collection('borrow')
          .snapshots(),
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
                  return _borrowCardsBuilder(
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
