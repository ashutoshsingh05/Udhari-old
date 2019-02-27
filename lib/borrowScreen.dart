import 'package:flutter/material.dart';

class Borrow extends StatefulWidget {
  @override
  _BorrowState createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
  Widget _borrowCardsBuilder(
      String receipent, String borrowContext, int amount) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: Icon(
              Icons.tag_faces,
              color: Colors.red,
            ),
            title: Text("$receipent"),
            subtitle: Text("$borrowContext"),
            trailing: SizedBox(
              child: Text('₹$amount'),
              width: 50,
            ),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
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
            _borrowCardsBuilder('Tanmay Ambadkar', 'Medical Store', 100),
            _borrowCardsBuilder('Ekansh', 'DAAICT', 100),
            _borrowCardsBuilder('Yash Shaw', 'Sponsorship, Sandwich', 54),
            _borrowCardsBuilder("Harsh Kakani", 'Sponsorship, SandWich', 34),
            _borrowCardsBuilder("Somebody", "Anything", 100000),
            _borrowCardsBuilder("Nobody", "Something", 100)
          ],
        ),
      ),
    );
  }
}
