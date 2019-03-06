import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device_id/device_id.dart';

void main() => runApp(new DeviceID());

class DeviceID extends StatefulWidget {
  @override
  _DeviceIDState createState() => new _DeviceIDState();
}

class _DeviceIDState extends State<DeviceID> {
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

    setState(() {
      _deviceid = deviceid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Your device id: $_deviceid');
  }
}
