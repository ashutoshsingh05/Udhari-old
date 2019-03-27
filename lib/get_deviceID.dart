import 'package:flutter/material.dart';
import 'dart:async';
import 'package:device_id/device_id.dart';

class DeviceID extends StatefulWidget {
  @override
  DeviceIDState createState() => new DeviceIDState();
}

class DeviceIDState extends State<DeviceID> {

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

  @override
  Widget build(BuildContext context) {
    initDeviceId();
    return Text("$_deviceid");
  }
}
