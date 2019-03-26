import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Borrow extends StatefulWidget {
  @override
  _BorrowState createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
  var myDatabase = Firestore.instance.collection('Users').
      document('912bb235e52b3196')
      .collection('borrow');

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
                  Text("$borrowContext"),
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
                  onPressed: () {},
                ),
                FlatButton(
                  child: const Text('Mark as paid'),
                  onPressed: () {},
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
                  return _borrowCardsBuilder("${document['Name']}", "${document['Context']}", document['Amount'],"DATE");
                }).toList()),
              ),
            );
        }
      },
    );

    // return Center(
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: <Widget>[
    //         _borrowCardsBuilder('Tanmay ', 'Medical Store', 100, "10 Jan"),
    //         _borrowCardsBuilder('Ekansh', 'DAAICT', 100, "10 Jan"),
    //         _borrowCardsBuilder('Yash Shaw', 'Sandwich', 54, "10 Jan"),
    //         _borrowCardsBuilder("Harsh Kakani", "Sponsorship", 34, "10 Jan"),
    //         _borrowCardsBuilder("Somebody", "Anything", 100000, "10 Jan"),
    //         _borrowCardsBuilder("Nobody", "Something", 100, "10 Jan"),
    //         _borrowCardsBuilder("Dhyey", "Yash Birthday", -35, "27 Feb"),
    //       ],
    //     ),
    //   ),
    // );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: <Widget>[
  //           Padding(
  //             padding: EdgeInsets.only(top: 10),
  //           ),
  //           StreamBuilder(
  //             stream: myDatabase
  //                 // .collection('912bb235e52b3196')
  //                 // .document('individual_borrow')
  //                 .snapshots(),
  //             builder: (BuildContext context, AsyncSnapshot snapshot) {
  //               if (snapshot.hasData) return CircularProgressIndicator();
  //               return _borrowCardsBuilder(snapshot.data.document['Name'],
  //                   'Medical Store', 100, "10 Jan");
  //             },
  //           ),
  //           // _borrowCardsBuilder('Tanmay Ambadkar', 'Medical Store', 100,"10 Jan"),
  //           // _borrowCardsBuilder('Ekansh', 'DAAICT', 100,"10 Jan"),
  //           // _borrowCardsBuilder('Yash Shaw', 'Sponsorship, Sandwich', 54,"10 Jan"),
  //           // _borrowCardsBuilder("Harsh Kakani", "Sponsorship, SandWich", 34,"10 Jan"),
  //           // _borrowCardsBuilder("Somebody", "Anything", 100000,"10 Jan"),
  //           // _borrowCardsBuilder("Nobody", "Something", 100,"10 Jan"),
  //           // _borrowCardsBuilder("Dhyey", "Yash Shaw Birthday Cake", -35,"27 Feb"),
  //         ],
  //       ),
  //     ),
  //   );
  //}
}
