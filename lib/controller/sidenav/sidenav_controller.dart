// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class SideNavController extends ChangeNotifier {
  String? iteamselector = "home";
  String? get getiteamselector => iteamselector;

  Future SideNavIteamSelector(giteamselector) async {
    iteamselector = giteamselector;
    notifyListeners();
  }
}
