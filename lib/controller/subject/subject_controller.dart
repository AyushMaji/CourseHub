// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class SubjectController extends ChangeNotifier {
  String? sub;
  String? get getsub => sub;

  Future SelectSubject(gdataCatagory) async {
    sub = gdataCatagory;
    notifyListeners();
  }
}
