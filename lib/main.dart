import 'package:flutter/material.dart';
import 'package:udhari/borrowScreen.dart';
import 'package:udhari/lendScreen.dart';
import 'get_deviceID.dart';
import 'data_input.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  DeviceIDState newDevice = new DeviceIDState();

  void _showDataScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return InputData();
        },
        fullscreenDialog: true,
      ),
    );
  }

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
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Sorry! This feature is in development right now 😅",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.black12,
                textColor: Colors.black87,
                fontSize: 16.0);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Sorry! This feature is in development right now 😅",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.black12,
                textColor: Colors.black87,
                fontSize: 16.0);
            },
            icon: Icon(Icons.more_vert),
          ),
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
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text("Device ID before build: " + newDevice.getDeviceID()),
      //       DeviceID(),
      //       Text("Device ID after build: " + newDevice.getDeviceID()),
      //     ],
      //   ),
      // ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Borrow(),
          Lend(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add udhari',
        child: Icon(Icons.add),
        onPressed: _showDataScreen,
      ),
    );
  }
}
