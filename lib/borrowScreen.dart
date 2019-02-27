import 'package:flutter/material.dart';

class Borrow extends StatefulWidget {
  @override
  _BorrowState createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
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
              child:Column(
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
                  onPressed: () {/* ... */},
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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            _borrowCardsBuilder('Tanmay Ambadkar', 'Medical Store', 100,"10 Jan"),
            _borrowCardsBuilder('Ekansh', 'DAAICT', 100,"10 Jan"),
            _borrowCardsBuilder('Yash Shaw', 'Sponsorship, Sandwich', 54,"10 Jan"),
            _borrowCardsBuilder("Harsh Kakani", "Sponsorship, SandWich", 34,"10 Jan"),
            _borrowCardsBuilder("Somebody", "Anything", 100000,"10 Jan"),
            _borrowCardsBuilder("Nobody", "Something", 100,"10 Jan"),
            _borrowCardsBuilder("Dhyey", "Yash Shaw Birthday Cake", -35,"27 Feb"),
          ],
        ),
      ),
    );
  }
}
