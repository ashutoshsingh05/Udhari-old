import 'package:flutter/material.dart';
import 'package:udhari/borrowScreen.dart';
import 'lendScreen.dart';
import 'login.dart';
import 'fancy_fab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(TabBarClass());

class TabBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Udhari",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
        leading: Icon(Icons.face),
        title: Text("Udhari"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text("Borrow Record"),
            ),
            Tab(
              child: Text("Lend Record"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Borrow(),
          Lend(),
        ],
      ),
      floatingActionButton: FancyFab(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Add new Record',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
