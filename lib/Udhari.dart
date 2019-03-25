//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

class UdhariClass {
  int _amount;
  String _context, _name, _date;
  var myDatabase = Firestore.instance;

  void printData() {
    print("Amount: $_amount \nName: $_name \nContext: $_context\nDate: $_date");
  }

  Future<bool> connected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else
      return false;
  }

  void getData(
      int _getAmount, String _getName, String _getContext, String _getDate) {
    _amount = _getAmount;
    _name = _getName;
    _context = _getContext;
    _date = _getDate;
  }

  set amount(String newAmount) {
    this._amount = int.parse(newAmount);
  }

  set context(String newContext) {
    this._context = newContext;
  }

  set name(String newName) {
    this._name = newName;
  }

  set date(String newDate) {
    this._date = newDate;
  }

  void pushToFirebase() {
    myDatabase
        .collection('Users')
        .document('912bb235e52b3196')
        .collection('borrow')
        .document('${this._name}')
        .setData({
      'Name': this._name,
      'Amount': this._amount,
      'Context': this._context,
      'Date': this._date,
    }).then((_) {
      print("Data for ${this._name} Added Successfully");
    }).catchError((_) {
      print("Errro occured!!");
    });
  }
}
