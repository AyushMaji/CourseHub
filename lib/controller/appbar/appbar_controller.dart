import 'package:flutter/material.dart';

class AppbarController extends ChangeNotifier {
  String? selectdata = "Class 12";
  String? get getselectdata => selectdata;

  Future selectCatagory(gselectdata) async {
    selectdata = gselectdata;
    notifyListeners();
  }
}
